# Git for Windows – PilotDeploy-Paket

**Status: gebaut, noch nicht zur Bereitstellung freigegeben.**

Version 2.55.0.5; Architektur x64; Paketrevision 1. Ziel: Windows 11 x64, Installation im Systemkontext.

Mit PilotDeploy erstellt: lokale Original-Engine, Commit `bf44d07313f9bdbf40bf82ee3c4e4eb389c0bd36`. [Paketierungsworkflow](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/tools/PACKAGING.md).

## Installation und Deinstallation

Paket vollständig entpacken. In einer administrativen PowerShell aus dem Paketordner starten:

```powershell
.\Deploy-Application.exe -DeploymentType Install -DeployMode Silent
.\Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent
```

Herstellerparameter für Installation: `/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS`. Deinstallation: `"%ProgramFiles%\Git\unins000.exe" /VERYSILENT /NORESTART`. Vor Einsatz offene App-Prozesse und vorhandene Installationen prüfen. Die Wiederholung und ein Upgrade sind noch separat zu testen.

## Intune und Erkennung

App-Typ: Windows-App (Win32). Installationsverhalten: System. Architektur: 64 Bit. Mindestbetriebssystem und zusätzliche Hersteller-Voraussetzungen vor Freigabe gegen die festgelegte Version prüfen.

Installationsbefehl: `Deploy-Application.exe -DeploymentType Install -DeployMode Silent`. Deinstallationsbefehl: `Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent`.

Vorgesehene Erkennung: Datei `%ProgramFiles%\Git\cmd\git.exe`, Versionsvergleich mindestens `2.55.0.5`. Das ist eine vorgeschlagene Regel; tatsächlichen Dateiversionswert nach Installation prüfen. In Intune keine 32-Bit-Zuordnung für diese x64-Datei verwenden.

Die zusätzliche INTUNEWIN-Datei wird mit Microsofts Content Prep Tool erzeugt, unabhängig vom PilotDeploy-Export. Dazu `Intune/Create-IntuneWin.ps1` mit explizitem Ausgabeordner außerhalb des Paketordners verwenden.

## Quellen, Prüfsummen und Freigabe

[Hersteller-Installer](https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.5/Git-2.55.0.5-64-bit.exe)

Installer SHA-256: `d065a4e23c3d9a6b5073d609b5be0830227ec3ca053c083ba385061ddfaf94c6`. Die Prüfsummen der vollständigen Archive stehen im [Paketmanifest](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/app-packages.manifest.json).

Enthaltene Hersteller-Lizenzen müssen erhalten bleiben. Lizenztexte, Quellcodebeigaben beziehungsweise gültiges Quellcodeangebot und zusätzliche Komponenten sind je App noch vollständig zur Weitergabe zu prüfen. Die PilotDeploy-MIT-Lizenz liegt dem ZIP bei.

Abnahmestand: Paket gebaut; Neuinstallation, erneute Ausführung, Upgrade, Deinstallation, Erkennung und Intune-Bereitstellung noch offen. Kein Installationstestdatum vorhanden. Deshalb gibt es noch keinen öffentlichen Release-Download.
