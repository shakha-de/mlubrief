# MLU Brief LaTeX Vorlage

siehe https://www2.informatik.uni-halle.de/mlubrief/

---

## Vereinfachte Version (2026)

Diese Version verwendet eine einzelne Klassendatei (`mlubrief2.cls`) mit modernen LaTeX-Paketen.

### Dateien

| Datei | Beschreibung |
|-------|--------------|
| `mlubrief2.cls` | Klassendatei mit Layout |
| `mlubrief-simple.tex` | Beispiel-Brief |
| `mlubriefSiegelMitText.pdf` | Universitätssiegel |

### Verwendung

```latex
\documentclass{mlubrief2}

% Absender-Informationen
\setname{Dr. Max Mustermann}
\setaddress{Universitätsplatz 1\\06108 Halle (Saale)}
\setphone{+49 345 55-12345}
\setemail{max.mustermann@uni-halle.de}
\seturl{www.uni-halle.de}
\setdepartment{Naturwissenschaftliche Fakultät I}
\setinstitute{Institut für Informatik}
\setchair{Lehrstuhl für...}              % optional

% Geschäftszeile
\setyourref{ABC-123}                      % Ihre Zeichen
\setyourmail{5. Januar 2026}              % Ihr Schreiben vom
\setmyref{XYZ-456}                        % Unsere Zeichen
\setletterdate{12. Januar 2026}           % Datum (Standard: \today)

\begin{document}
\begin{letter}{Empfänger\\Straße\\PLZ Ort}
  \opening{Sehr geehrte...}
  
  Brieftext...
  
  \closing{Mit freundlichen Grüßen}
\end{letter}
\end{document}
```

### Verfügbare Befehle

| Befehl | Feld |
|--------|------|
| `\setname{...}` | Absendername |
| `\setaddress{...}` | Hausanschrift |
| `\setphone{...}` | Telefon |
| `\setemail{...}` | E-Mail |
| `\seturl{...}` | Internet |
| `\setdepartment{...}` | Fakultät |
| `\setinstitute{...}` | Institut |
| `\setchair{...}` | Lehrstuhl |
| `\setyourref{...}` | Ihre Zeichen |
| `\setyourmail{...}` | Ihr Schreiben vom |
| `\setmyref{...}` | Unsere Zeichen |
| `\setletterdate{...}` | Datum |

### Kompilieren

```bash
pdflatex mlubrief-simple.tex
```