#!/usr/bin/env bash
#
# Rendert die Bewerbungsunterlagen von Jamila Alo aus HTML/CSS nach PDF.
#
#   ./build.sh
#
# Ergebnis in build/:
#   Bewerbung_Jamila_Alo_Wassermann.pdf   (Deckblatt + Anschreiben + Lebenslauf)
#   sowie die drei Seiten einzeln
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/src"
OUT="$ROOT/build"
mkdir -p "$OUT"

CHROME=""
for c in /opt/pw-browsers/chromium-*/chrome-linux/chrome \
         "$(command -v chromium || true)" \
         "$(command -v chromium-browser || true)" \
         "$(command -v google-chrome || true)"; do
  if [ -n "$c" ] && [ -x "$c" ]; then CHROME="$c"; break; fi
done
if [ -z "$CHROME" ]; then
  echo "Kein Chromium gefunden." >&2
  exit 1
fi

render() {
  local name="$1" outfile="$2"
  echo "  -> $outfile"
  "$CHROME" --headless --disable-gpu --no-sandbox --no-pdf-header-footer \
    --allow-file-access-from-files \
    --run-all-compositor-stages-before-draw --virtual-time-budget=15000 \
    --print-to-pdf="$OUT/$outfile" "file://$SRC/$name" 2>/dev/null
}

echo "Rendere Seiten:"
render deckblatt.html   Deckblatt_Jamila_Alo.pdf
render anschreiben.html Anschreiben_Jamila_Alo.pdf
render lebenslauf.html  Lebenslauf_Jamila_Alo.pdf

echo "Füge Gesamtdokument zusammen:"
python3 -I - "$OUT" <<'PY'
import sys, pymupdf
out = sys.argv[1]
doc = pymupdf.open()
for part in ("Deckblatt_Jamila_Alo.pdf",
             "Anschreiben_Jamila_Alo.pdf",
             "Lebenslauf_Jamila_Alo.pdf"):
    doc.insert_pdf(pymupdf.open(f"{out}/{part}"))
doc.set_metadata({
    "title": "Bewerbung Jamila Alo – Ausbildung zur Zahntechnikerin",
    "author": "Jamila Alo",
    "subject": "Bewerbung um einen Ausbildungsplatz, Wassermann Zahntechnik GmbH",
})
doc.save(f"{out}/Bewerbung_Jamila_Alo_Wassermann.pdf", deflate=True, garbage=4)
print(f"  -> Bewerbung_Jamila_Alo_Wassermann.pdf ({doc.page_count} Seiten)")
PY

echo "Fertig."
