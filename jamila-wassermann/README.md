# Bewerbung Jamila Alo – Wassermann Zahntechnik GmbH, Oldenburg

Bewerbung um einen Ausbildungsplatz zur **Zahntechnikerin**, Ausbildungsbeginn
1. August 2027.

Aufgebaut im Hellblau-Weiß-Stil der Canva-Vorlage (`src/original_vorlage_canva.pdf`),
aber als HTML/CSS, damit sich Texte und Daten ändern lassen, ohne dass das Layout
verrutscht.

## Fertige PDFs

| Datei | Inhalt |
| --- | --- |
| `build/Bewerbung_Jamila_Alo_Wassermann.pdf` | Deckblatt + Anschreiben + Lebenslauf |
| `build/Deckblatt_Jamila_Alo.pdf` | nur Seite 1 |
| `build/Anschreiben_Jamila_Alo.pdf` | nur Seite 2 |
| `build/Lebenslauf_Jamila_Alo.pdf` | nur Seite 3 |

## Neu erzeugen

```bash
./build.sh
```

Gebraucht werden Chromium (oder Google Chrome) und Python mit `pymupdf`
(`pip install pymupdf`).

## ⚠️ Noch einzutragen

Im Lebenslauf sind die fehlenden Angaben **gelb markiert**. Ohne sie sollte die
Bewerbung nicht raus. Es fehlen:

- Geburtsdatum und Geburtsort
- Name und Ort der Schule sowie die Jahre des Realschulabschlusses
- Zu beiden Praktika: Betrieb, Ort, Jahr und Dauer
- Sprachniveaus (Deutsch, Arabisch, Englisch)
- Zwei Interessen – für die Zahntechnik zählt alles, wofür man Geduld und
  ruhige Hände braucht: Zeichnen, Handarbeit, Basteln, Nähen

Nach dem Eintragen in `src/lebenslauf.html` die `<span class="todo">…</span>`
jeweils mit entfernen, dann `./build.sh`.

Soll nur die gelbe Markierung weg, die Klammertexte aber bleiben:
`<body class="ohne-marker">` in `src/lebenslauf.html` setzen.

## Was der Betrieb verlangt

Laut der Ausbildungsseite von Wassermann gehören zur Bewerbung:
**Lebenslauf, Foto und das letzte Schulzeugnis.** Das Zeugnis muss noch
dazugelegt werden, es ist in den Anlagen schon aufgeführt.

- Dauer: 3,5 Jahre, Abschluss Gesellenprüfung
- Voraussetzung: mindestens Hauptschulabschluss
- Berufsschule: BBS II Oldenburg, dazu überbetriebliche Kurse
- Einstellungstest: ab Mitte Januar
- Bewerbung per E-Mail an `bewerbung@wassermann-zahntechnik.de`,
  online, per Post oder persönlich

## Aufbau

```
src/deckblatt.html     Seite 1 – Deckblatt mit Foto
src/anschreiben.html   Seite 2 – Anschreiben
src/lebenslauf.html    Seite 3 – Lebenslauf
src/styles.css         gemeinsames Layout, Maße in pt
assets/                Bewerbungsfoto, auf 3:4 zugeschnitten
../fonts/              Montserrat und Caveat (SIL Open Font License)
src/original_vorlage_canva.pdf   die Ausgangsvorlage
```

## Was gegenüber der Vorlage geändert wurde

- **Lebenslauf ergänzt.** In der Vorlage gab es nur Deckblatt und Anschreiben.
  Wassermann verlangt aber ausdrücklich einen Lebenslauf – der fehlte also
  genau das, worauf der Betrieb schaut.
- **Datum korrigiert.** In der Vorlage stand der 22.05.2030.
- **Ausbildungsbeginn benannt:** 1. August 2027. Der Start im August 2026 ist
  vorbei, und der Einstellungstest läuft ab Mitte Januar.
- **Anschreiben neu geschrieben.** Der alte Text war austauschbar – er hätte zu
  jedem Labor gepasst. Jetzt stehen der Betrieb, die Dauer der Ausbildung, die
  BBS II und der Einstellungstest drin. Das zeigt, dass sie sich den Betrieb
  angesehen hat.
- **Doppelte Telefonnummer entfernt.** In der Vorlage waren Handy und Festnetz
  dieselbe Nummer. Jetzt steht nur „Telefon".
- **Tippfehler „Tele:" korrigiert.**
- **Überlappung behoben.** In der Vorlage lief das Datum quer durch die
  Betreffzeile.
- **Absätze bekommen Abstand.** Vorher klebte der ganze Brieftext zusammen.
- **Schrägschrift gerade gestellt.** Auf dem Deckblatt lief der Text diagonal
  über die Seite. Die schrägen Blauflächen sind geblieben, der Text steht jetzt
  waagerecht und ist leichter zu lesen.
- **Schrift:** Montserrat statt Gotham, Caveat für die Unterschrift – beide frei
  lizenziert, damit sich die PDFs überall gleich erzeugen lassen.

## Vor dem Absenden prüfen

- Die gelben Markierungen müssen alle weg sein.
- Letztes Schulzeugnis als Anlage beilegen.
- Die Unterschrift ist gesetzt, nicht handschriftlich. Wer auf Papier schickt,
  unterschreibt am besten noch von Hand darüber.
- Firmierung und Anschrift stammen vom Impressum unter
  `wassermann-zahntechnik.de` (Stand Oktober 2026).
