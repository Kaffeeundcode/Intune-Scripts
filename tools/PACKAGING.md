# Paketbau

`build-pilotdeploy-packages.mjs` verwendet die vorhandene PilotDeploy-Quellengine read-only und schreibt die fünf PSADT-ZIPs nach `.artifacts/packages/`. Der Checkout wird nicht verändert:

```powershell
node tools/packages/build-pilotdeploy-packages.mjs "/Volumes/Daten/Antigravity/Web Apps/PilotDeploy"
```

Die Quellen werden mit Commit und SHA-256 im jeweiligen `*-build.json` festgehalten. Hersteller-Installer werden aus den URLs in `app-packages.manifest.json` geladen und gegen die dort hinterlegte Prüfsumme geprüft.

Die `.intunewin`-Datei wird erst auf Windows erzeugt. Entpacke dazu die freigegebene PSADT-ZIP und starte `Intune/Create-IntuneWin.ps1` mit Microsofts `IntuneWinAppUtil.exe`. Der Vorgang muss den Installer-Ordner und die Ausgabe getrennt halten. Die erzeugte Datei erhält danach einen eigenen SHA-256-Nachweis und wird erst nach den Windows- und Intune-Tests als Release-Asset veröffentlicht.
