#!/usr/bin/env bash
#
# Rendert die Bewerbungsunterlagen aus HTML/CSS nach PDF.
#
#   ./build.sh
#
# Ergebnis in build/:
#   Anschreiben_Fahmi_Alo.pdf
#   Lebenslauf_Fahmi_Alo.pdf
#   Bewerbung_Fahmi_Alo_Munderloh.pdf   (beide Seiten zusammen)
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/src"
OUT="$ROOT/build"
mkdir -p "$OUT"

# Chromium finden: erst die Playwright-Installation, dann das System.
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
    --run-all-compositor-stages-before-draw --virtual-time-budget=10000 \
    --print-to-pdf="$OUT/$outfile" "file://$SRC/$name" 2>/dev/null
}

echo "Rendere Seiten:"
render anschreiben.html Anschreiben_Fahmi_Alo.pdf
render lebenslauf.html  Lebenslauf_Fahmi_Alo.pdf

echo "Füge Gesamtdokument zusammen:"
python3 - "$OUT" <<'PY'
import sys, pymupdf
out = sys.argv[1]
doc = pymupdf.open()
for part in ("Anschreiben_Fahmi_Alo.pdf", "Lebenslauf_Fahmi_Alo.pdf"):
    doc.insert_pdf(pymupdf.open(f"{out}/{part}"))
doc.set_metadata({
    "title": "Bewerbung Fahmi Alo – Kfz-Mechatroniker, Schwerpunkt Nutzfahrzeugtechnik",
    "author": "Fahmi Alo",
    "subject": "Bewerbung um einen Ausbildungsplatz",
})
doc.save(f"{out}/Bewerbung_Fahmi_Alo_Munderloh.pdf", deflate=True, garbage=4)
print(f"  -> Bewerbung_Fahmi_Alo_Munderloh.pdf ({doc.page_count} Seiten)")
PY

echo "Fertig."
