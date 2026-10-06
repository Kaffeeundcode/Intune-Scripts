# KaffeeundCode Skriptbibliothek

597 PowerShell-Skriptdateien für Intune, Teams-Telefonie, Entra ID, Azure und M365. Die 500 ursprünglichen Dateipfade bleiben erhalten; insgesamt 97 Dateien wurden später ergänzt. Die neuen Bloecke decken Device Inventory, App Ecosystem, Policy Hygiene, Security Deep Dive, Governance, User Device Mapping, Network Readiness, Tenant Operational Health, Lifecycle Gaps, Policy Gaps, Datenqualität, operative Audits, Adoptionskennzahlen, Sicherheitslücken und Statusmatrizen ab. GitHub ist die Quelle für die bestehende Skriptbibliothek auf [KaffeeundCode](https://www.kaffeeundcode.com/scripts/).

## Einzeldateien verwenden

Die 241 Skripte mit eigener Hilfslogik enthalten diese jetzt direkt. Eine kopierte Datei benötigt weder den restlichen Repository-Ordner noch einen automatischen Nachladevorgang. Externe Voraussetzungen wie Microsoft Graph, MicrosoftTeams, Az oder ExchangeOnlineManagement und die jeweiligen Berechtigungen gelten weiterhin. Parameter, Voraussetzungen und Beispiele stehen in der Skripthilfe.

```powershell
Get-Help ./01_Device_Management/05_Get-IntuneDeviceDetails.ps1 -Full
./01_Device_Management/05_Get-IntuneDeviceDetails.ps1 -DeviceId 'managed-device-id'
```

Speichere Skripte für Windows PowerShell 5.1 als UTF-8 mit BOM. Ändernde Skripte vor Verwendung auf Zielgeräte und Berechtigungen prüfen; `-WhatIf` verwenden, wenn das Skript es unterstützt.

## Bestand und Prüfstatus

Der [Katalog](script_catalog/README.md) enthält 597 Einträge. Davon sind 579 ungeprüft, neun Beispiele und neun mit bekannten Fehlern markiert. Die erste Auswahl umfasst 100 bestehende Skripte, davon 70 mit direktem Intune-Bezug. Auswahl bedeutet keine Freigabe.

- **Ungeprüft:** vollständige fachliche Abnahme fehlt.
- **Geprüft:** aktuelle, quellenbezogene Nachweise für alle erforderlichen Prüfungen vorhanden.
- **Beispiel:** muss für die konkrete Umgebung ergänzt oder angepasst werden.
- **Bekannte Fehler:** Einschränkungen sind konkret dokumentiert.

Der letzte vollständige Windows-Nachweis vom 8. September 2026 umfasst die damaligen 528 Skripte und 25 Offline-Pester-Tests unter Windows PowerShell 5.1 und PowerShell 7.6.5. Für den aktuellen Stand sind 28 Pester-Tests definiert. Die neuen Reports, Inventur-Skripte und die zwei überarbeiteten Skripte benötigen noch Syntax-, Pester- und Tenant-Tests in einer PowerShell-Umgebung. Der lokale Katalogtest, der Bundle-Abgleich und der Katalog-Abgleich sind aktuell bestanden. Kein Testtenant ist verbunden; deshalb gibt es keine vollständige Cloud-Abnahme und keine pauschale Produktionsfreigabe. Der ältere statische Analysebericht liegt unter `validation/evidence/psscriptanalyzer.json` und ist für die neuen Dateien noch nicht erneuert.

## Darstellung auf KaffeeundCode

Der vorhandene Import verarbeitet die PowerShell-Dateien und deren SYNOPSIS/DESCRIPTION. Deshalb steht der Prüfstatus direkt in jeder Skripthilfe. Der zusätzliche JSON-/Markdown-Katalog ist ein Repository-Verzeichnis, keine neue Website und keine Voraussetzung für den bestehenden Import.

Der öffentliche Bestandsabgleich ergab 535 Website-Einträge: 500 passende Bestandsskripte, eine Helper-Seite und 34 weitere Seiten ohne aktuellen gleichnamigen Skriptpfad. Diese bestehenden Seiten werden nicht gelöscht. Die 97 später ergänzten Dateien und fünf Paketbeschreibungen kommen beim Import hinzu. Die bisherige Website-Sortierung wird durch diese Repository-Änderung nicht automatisch auf Intune umgestellt.

## PilotDeploy-App-Pakete

[7-Zip](18_App_Packages/7zip/README.md), [Notepad++](18_App_Packages/notepadplusplus/README.md), [VLC](18_App_Packages/vlc/README.md), [Git for Windows](18_App_Packages/git/README.md) und [PowerToys](18_App_Packages/powertoys/README.md) besitzen je eine deutsche Beschreibung für den vorhandenen README-Import.

Die fünf PSADT-ZIPs wurden mit der vorhandenen PilotDeploy-Engine erzeugt und anschließend mit Microsofts Content Prep Tool unter Windows separat in INTUNEWIN-Dateien verpackt. Herkunft, Versionen und SHA-256-Werte stehen im [Paketmanifest](app-packages.manifest.json). Die Binärdateien liegen lokal unter `.artifacts/packages/` und gehören nicht in Git-Commits.

Diese App-Pakete sind noch nicht öffentlich freigegeben: Installation, Wiederholung, Upgrade, Deinstallation, tatsächliche Detection, Intune-Bereitstellung und vollständige Hersteller-Weitergabeprüfung stehen aus. Die Beschreibungen enthalten deshalb noch keine öffentlichen Downloadlinks.

## Pflege und Tests

```text
npm run prepare:library
npm run bundles:check
npm run catalog:check
npm test
```

Hilfsfunktionen in `Common/IntuneLibrary.psm1`, `Common/IntuneReportLibrary.psm1` beziehungsweise der bestehenden Teams-Helper-Datei pflegen und danach `prepare:library` ausführen. Eingebettete Bereiche werden daraus reproduzierbar aktualisiert. Änderungen am Quellcode machen alte fachliche Nachweise ungültig. Die PowerShell-Testläufe werden getrennt durch die Werkzeuge unter `tools/qa/powershell/` ausgeführt.

Apps monatlich auf neue Versionen und Quellen prüfen; Skripte spätestens nach sechs Monaten oder relevanten Moduländerungen erneut abnehmen. Es wird keine Automation eingerichtet.

Autor: Mattia Cirillo · [KaffeeundCode](https://www.kaffeeundcode.com/)
