# VLC – PilotDeploy-Paket

**Status: gebaut, noch nicht zur Bereitstellung freigegeben.**

Version 3.0.23; Architektur x64; Paketrevision 1. Ziel: Windows 11 x64, Installation im Systemkontext.

Mit PilotDeploy erstellt: lokale Original-Engine, Commit `bf44d07313f9bdbf40bf82ee3c4e4eb389c0bd36`. [Paketierungsworkflow](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/tools/PACKAGING.md).

## Installation und Deinstallation

Paket vollständig entpacken. In einer administrativen PowerShell aus dem Paketordner starten:

```powershell
.\Deploy-Application.exe -DeploymentType Install -DeployMode Silent
.\Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent
```

Herstellerparameter für Installation: `/S`. Deinstallation: `"%ProgramFiles%\VideoLAN\VLC\uninstall.exe" /S`. Vor Einsatz offene App-Prozesse und vorhandene Installationen prüfen. Die Wiederholung und ein Upgrade sind noch separat zu testen.

## Intune und Erkennung

App-Typ: Windows-App (Win32). Installationsverhalten: System. Architektur: 64 Bit. Mindestbetriebssystem und zusätzliche Hersteller-Voraussetzungen vor Freigabe gegen die festgelegte Version prüfen.

Installationsbefehl: `Deploy-Application.exe -DeploymentType Install -DeployMode Silent`. Deinstallationsbefehl: `Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent`.

Vorgesehene Erkennung: Datei `%ProgramFiles%\VideoLAN\VLC\vlc.exe`, Versionsvergleich mindestens `3.0.23`. Das ist eine vorgeschlagene Regel; tatsächlichen Dateiversionswert nach Installation prüfen. In Intune keine 32-Bit-Zuordnung für diese x64-Datei verwenden.

Die zusätzliche INTUNEWIN-Datei wird mit Microsofts Content Prep Tool erzeugt, unabhängig vom PilotDeploy-Export. Dazu `Intune/Create-IntuneWin.ps1` mit explizitem Ausgabeordner außerhalb des Paketordners verwenden.

## Quellen, Prüfsummen und Freigabe

[Hersteller-Installer](https://download.videolan.org/pub/videolan/vlc/3.0.23/win64/vlc-3.0.23-win64.exe)

Installer SHA-256: `20ad191348684b470ddc4e05204316f3d8e39655f412b3e392a0eef97639daaf`. Die Prüfsummen der vollständigen Archive stehen im [Paketmanifest](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/app-packages.manifest.json).

Enthaltene Hersteller-Lizenzen müssen erhalten bleiben. Lizenztexte, Quellcodebeigaben beziehungsweise gültiges Quellcodeangebot und zusätzliche Komponenten sind je App noch vollständig zur Weitergabe zu prüfen. Die PilotDeploy-MIT-Lizenz liegt dem ZIP bei.

Abnahmestand: Paket gebaut; Neuinstallation, erneute Ausführung, Upgrade, Deinstallation, Erkennung und Intune-Bereitstellung noch offen. Kein Installationstestdatum vorhanden. Deshalb gibt es noch keinen öffentlichen Release-Download.
