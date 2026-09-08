import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
const manifest=JSON.parse(fs.readFileSync('app-packages.manifest.json','utf8'));
const root=process.cwd();
const license=process.argv[2];
if(!license)throw Error('Usage: node tools/packages/document-packages.mjs /PilotDeploy/LICENSE');
const digest=p=>crypto.createHash('sha256').update(fs.readFileSync(p)).digest('hex');
for(const p of manifest.packages){
    const base=`${p.id}-${p.version}-x64-r${p.revision}`;
    const text=`# ${p.name} – PilotDeploy-Paket\n\n**Status: gebaut, noch nicht zur Bereitstellung freigegeben.**\n\nVersion ${p.version}; Architektur x64; Paketrevision ${p.revision}. Ziel: Windows 11 x64, Installation im Systemkontext.\n\nMit PilotDeploy erstellt: lokale Original-Engine, Commit \`${p.pilotdeploy_commit}\`. [Paketierungsworkflow](../../tools/PACKAGING.md).\n\n## Installation und Deinstallation\n\nPaket vollständig entpacken. In einer administrativen PowerShell aus dem Paketordner starten:\n\n\`\`\`powershell\n.\\Deploy-Application.exe -DeploymentType Install -DeployMode Silent\n.\\Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent\n\`\`\`\n\nHerstellerparameter für Installation: \`${p.install_arguments}\`. Deinstallation: \`${p.uninstall_command}\`. Vor Einsatz offene App-Prozesse und vorhandene Installationen prüfen. Die Wiederholung und ein Upgrade sind noch separat zu testen.\n\n## Intune und Erkennung\n\nApp-Typ: Windows-App (Win32). Installationsverhalten: System. Architektur: 64 Bit. Mindestbetriebssystem und zusätzliche Hersteller-Voraussetzungen vor Freigabe gegen die festgelegte Version prüfen.\n\nInstallationsbefehl: \`Deploy-Application.exe -DeploymentType Install -DeployMode Silent\`. Deinstallationsbefehl: \`Deploy-Application.exe -DeploymentType Uninstall -DeployMode Silent\`.\n\nVorgesehene Erkennung: Datei \`${p.detection_path}\`, Versionsvergleich mindestens \`${p.detection_version||p.version}\`. Das ist eine vorgeschlagene Regel; tatsächlichen Dateiversionswert nach Installation prüfen. In Intune keine 32-Bit-Zuordnung für diese x64-Datei verwenden.\n\nDie zusätzliche INTUNEWIN-Datei wird mit Microsofts Content Prep Tool erzeugt, unabhängig vom PilotDeploy-Export. Dazu \`Intune/Create-IntuneWin.ps1\` mit explizitem Ausgabeordner außerhalb des Paketordners verwenden.\n\n## Quellen, Prüfsummen und Freigabe\n\n[Hersteller-Installer](${p.source_url})\n\nInstaller SHA-256: \`${p.installer_sha256}\`. Die Prüfsummen der vollständigen Archive stehen im [Paketmanifest](../../app-packages.manifest.json).\n\nEnthaltene Hersteller-Lizenzen müssen erhalten bleiben. Lizenztexte, Quellcodebeigaben beziehungsweise gültiges Quellcodeangebot und zusätzliche Komponenten sind je App noch vollständig zur Weitergabe zu prüfen. Die PilotDeploy-MIT-Lizenz liegt dem ZIP bei.\n\nAbnahmestand: Paket gebaut; Neuinstallation, erneute Ausführung, Upgrade, Deinstallation, Erkennung und Intune-Bereitstellung noch offen. Kein Installationstestdatum vorhanden. Deshalb gibt es noch keinen öffentlichen Release-Download.\n`;
    const folder=path.join('18_App_Packages',p.id);fs.mkdirSync(folder,{recursive:true});fs.writeFileSync(path.join(folder,'README.md'),text.replace('../../tools/PACKAGING.md','https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/tools/PACKAGING.md').replace('../../app-packages.manifest.json','https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/app-packages.manifest.json'));
    const content=path.join(root,'.artifacts/packages',p.id,'content');
    fs.copyFileSync(license,path.join(content,'PilotDeploy-LICENSE.txt'));
    fs.writeFileSync(path.join(content,'README-DE.md'),text.replace('../../tools/PACKAGING.md','https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/tools/PACKAGING.md').replace('../../app-packages.manifest.json','https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/app-packages.manifest.json'));
    const archive=path.join(root,'.artifacts/packages',base+'-PSADT.zip');
    execFileSync('zip',['-q',archive,'PilotDeploy-LICENSE.txt','README-DE.md'],{cwd:content});
    const provenancePath=path.join(root,'.artifacts/packages',p.id+'-build.json');
    const provenance=JSON.parse(fs.readFileSync(provenancePath,'utf8'));
    provenance.original_engine_archive_sha256??=provenance.archive_sha256;
    provenance.archive_sha256=digest(archive);
    provenance.additions=['PilotDeploy-LICENSE.txt','README-DE.md'].map(name=>({path:name,sha256:digest(path.join(content,name))}));
    fs.writeFileSync(provenancePath,JSON.stringify(provenance,null,2)+'\n');
    p.local_artifacts.find(a=>a.path.endsWith('-PSADT.zip')).sha256=provenance.archive_sha256;
    console.log(p.id);
}
fs.writeFileSync('app-packages.manifest.json',JSON.stringify(manifest,null,2)+'\n');
