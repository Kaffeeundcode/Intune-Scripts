# PilotDeploy-App-Pakete

Diese Kategorie beschreibt fünf Beispielpakete für den vorhandenen Importweg von KaffeeundCode. Sie sind keine zusätzlichen Skripte und werden im Skriptkatalog nicht mitgezählt.

| Paket | Version | Lokaler Stand |
|---|---:|---|
| 7-Zip | 26.03 | PilotDeploy-PSADT-ZIP erzeugt; Windows/Intune-Abnahme offen |
| Notepad++ | 8.9.8 | PilotDeploy-PSADT-ZIP erzeugt; Windows/Intune-Abnahme offen |
| VLC | 3.0.23 | PilotDeploy-PSADT-ZIP erzeugt; Windows/Intune-Abnahme offen |
| Git for Windows | 2.55.0.5 | PilotDeploy-PSADT-ZIP erzeugt; Windows/Intune-Abnahme offen |
| Microsoft PowerToys | 0.101.2362.0 | PilotDeploy-PSADT-ZIP erzeugt; Windows/Intune-Abnahme offen |

Die maschinenlesbaren Quellen, Installer-Prüfsummen und lokalen Artefaktpfade stehen in [`app-packages.manifest.json`](../app-packages.manifest.json). Die erzeugten ZIPs liegen im lokalen, von Git ignorierten Verzeichnis `.artifacts/packages/`. Vor einem GitHub-Release müssen Lizenz- und Weitergabebedingungen, Windows-Installation, Wiederholung, Upgrade, Deinstallation, Detection und die Intune-Bereitstellung abgenommen werden.

Die `.intunewin`-Datei wird separat mit Microsofts Win32 Content Prep Tool erzeugt. Das ist bewusst nicht als PilotDeploy-Exportfunktion bezeichnet. Die genaue Anleitung liegt in jedem Paket unter `Intune/README-IntuneWin.md`.
