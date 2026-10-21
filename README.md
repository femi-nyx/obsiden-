# Bewerbungen der Familie Alo

Zwei Bewerbungen, beide aus HTML/CSS nach PDF gerendert.

| Ordner | Bewerbung |
| --- | --- |
| dieser Ordner | **Fahmi Alo** – Kfz-Mechatroniker, Autohaus Munderloh Oldenburg |
| [`jamila-wassermann/`](jamila-wassermann/) | **Jamila Alo** – Zahntechnikerin, Wassermann Zahntechnik Oldenburg |

---

# Bewerbung Fahmi Alo – Autohaus Munderloh, Oldenburg

Bewerbung um einen Ausbildungsplatz als Kraftfahrzeugmechatroniker,
Schwerpunkt Nutzfahrzeugtechnik.

Die Unterlagen werden aus HTML/CSS nach PDF gerendert. Damit lassen sich Adressat,
Texte und Layout ändern, ohne dass das Design verrutscht.

## Fertige PDFs

| Datei | Inhalt |
| --- | --- |
| `build/Bewerbung_Fahmi_Alo_Munderloh.pdf` | Anschreiben + Lebenslauf (zum Versenden) |
| `build/Anschreiben_Fahmi_Alo.pdf` | nur Seite 1 |
| `build/Lebenslauf_Fahmi_Alo.pdf` | nur Seite 2 |

## Neu erzeugen

```bash
./build.sh
```

Gebraucht werden Chromium (oder Google Chrome) und Python mit `pymupdf`
(`pip install pymupdf`). Das Skript findet Chromium selbstständig.

## Aufbau

```
src/anschreiben.html   Seite 1 – Anschreiben
src/lebenslauf.html    Seite 2 – Lebenslauf
src/styles.css         gemeinsames Layout, alle Maße in pt
fonts/                 Open Sans (SIL Open Font License)
src/original_bewerbung_senger.pdf   Ausgangsfassung, adressiert an Egon Senger
```

## Das Foto einkleben

Im Lebenslauf ist oben rechts eine Klebefläche mit dem **Innenmaß 45 × 60 mm** –
dem Standardformat für ein Bewerbungsfoto. Die vier Eckmarken zeigen, wo das Bild
sitzt; sie verschwinden unter dem aufgeklebten Foto.

Für die Druckfassung, auf der kein Hinweistext stehen soll, in
`src/lebenslauf.html` dem `<body>` die Klasse mitgeben:

```html
<body class="foto-blank">
```

Dann bleiben nur Rahmen und Eckmarken stehen. Danach `./build.sh` neu ausführen.

Wer das Foto lieber digital einsetzt, ersetzt in `src/lebenslauf.html` den Block
`<div class="photo">…</div>` durch:

```html
<div class="photo"><img src="../fotos/bewerbungsfoto.jpg" alt=""
     style="width:100%;height:100%;object-fit:cover"></div>
```

## Was gegenüber der Ausgangsfassung geändert wurde

- **Adressat:** statt Egon Senger GmbH jetzt Hermann Munderloh KFZ. GmbH & Co. KG,
  Haseler Weg 1, 26125 Oldenburg. Das ist der Betriebsteil für Mercedes-Benz und
  MAN, also der für Nutzfahrzeuge zuständige.
- **Anschreiben:** der Absatz zum Betrieb nennt jetzt Mercedes-Benz und MAN sowie
  den eigenen Fahrzeug- und Karosseriebau (Kofferaufbauten, Kühlfahrzeuge)
  statt der Angaben zum vorherigen Adressaten.
- **Berufsbezeichnung:** „Kraftfahrzeugmechatroniker, Schwerpunkt
  Nutzfahrzeugtechnik" – so heißt der Ausbildungsberuf offiziell.
- **Datum** auf den 14. September 2026 aktualisiert.
- **Lebenslauf:** Klebefläche fürs Foto, geschärftes Kurzprofil, zusätzlich
  „Verfügbar: sofort" unter Persönliches.
- **Signet im Kopfband:** der Mercedes-Stern ist durch ein markenneutrales
  Zeichen (Sechskant im Ring) ersetzt. Ein fremdes Markenlogo in den eigenen
  Unterlagen wirkt schnell unsauber – und Munderloh führt ohnehin mehrere Marken.
- **Schrift:** Open Sans statt Segoe UI, damit sich die PDFs auf jedem Rechner
  identisch erzeugen lassen.

## Vor dem Absenden prüfen

- Firmierung und Anschrift stammen vom Impressum unter `autohaus-munderloh.de`
  (Stand September 2026). Kurz gegenlesen, ob sie noch stimmen.
- Wenn in der Stellenanzeige eine Ansprechpartnerin oder ein Ansprechpartner
  genannt ist, „Sehr geehrte Damen und Herren" durch den Namen ersetzen – das
  wirkt deutlich persönlicher.
- Zeugnisse als weitere Anlagen beilegen.
