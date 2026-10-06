# Freigabecheckliste für KaffeeundCode

## Skripte

- [x] 500 bestehende Skripte bleiben einzeln auffindbar.
- [x] Insgesamt 19 Intune-Workflows sind als eigene Dateien ergänzt.
- [x] Katalog mit 597 Einträgen, Statuswerten und 100er-Erstauswahl erzeugt.
- [x] Der letzte vollständige Windows-Nachweis umfasst 528 Skripte und 25 Offline-Pester-Tests, inklusive separat kopierter Dateien in frischen Prozessen.
- [x] PSScriptAnalyzer 1.24.0 für diesen älteren Stand ausgeführt: 0 Fehler, 2.382 Warnungen dokumentiert (einschließlich wiederholt eingebetteter Hilfsfunktionen).
- [ ] Aktuelle Syntaxprüfung, 28 Offline-Pester-Tests und PSScriptAnalyzer für alle 597 Skripte unter Windows PowerShell 5.1 und PowerShell 7 ausführen.
- [x] 241 lokale Hilfsabhängigkeiten direkt in veröffentlichte Einzeldateien eingebettet; Status in allen 597 Skripthilfen.
- [x] Alle 535 öffentlichen Website-Einträge abgeglichen; 500 passen zum Bestand, 34 weitere Seiten und ein Helper bleiben erhalten.
- [ ] Für die cloudseitigen Werkzeuge Tenant-ID, Berechtigungen, Paging, Vererbung und Fehlerfälle testen.
- [ ] Erst danach einzelne Einträge auf `Geprüft` setzen.

## PilotDeploy-Pakete

- [x] 7-Zip, Notepad++, VLC, Git for Windows und PowerToys mit der vorhandenen PilotDeploy-Engine als PSADT-ZIP erzeugt.
- [x] Quellcommit, Installer-SHA-256, Paket-SHA-256 und PilotDeploy-Bewertung festgehalten.
- [x] ZIP-Struktur und enthaltene PowerShell-Skripte lokal geprüft.
- [ ] Auf Windows Neuinstallation, erneute Ausführung, Upgrade und Deinstallation testen.
- [ ] Detection auf dem Testgerät testen und Versions-/Architekturwerte festschreiben.
- [x] Microsofts Win32 Content Prep Tool unter Windows separat ausgeführt; fünf `.intunewin`-Dateien erstellt und SHA-256 dokumentiert.
- [ ] Lizenz- und Weitergabebedingungen je Hersteller abnehmen.
- [ ] Erst danach GitHub-Releases mit konkreten ZIP- und `.intunewin`-Assets veröffentlichen.

Der bestehende Import liest die PS1-Skripthilfe und die fünf App-README-Unterordner. Der zusätzliche Repository-Katalog wird dafür nicht benötigt. Neun lokale Katalog- und Importkompatibilitätstests prüfen Status, Pfade und Ausschluss interner Werkzeuge. Die echte Synchronisierung und anschließende Kontrolle auf KaffeeundCode erfolgt erst nach dem Upload; bislang wurde nichts veröffentlicht.
