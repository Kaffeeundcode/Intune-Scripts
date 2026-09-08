// Uses an existing PilotDeploy checkout. Does not modify it or replace its generator.
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { createRequire } from 'node:module';
import { pathToFileURL, fileURLToPath } from 'node:url';
import { execFileSync } from 'node:child_process';
const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)),'../..');
const checkout=process.argv[2];
if (!checkout) throw Error('Usage: node tools/packages/build-pilotdeploy-packages.mjs /path/to/PilotDeploy');
const frontend=path.resolve(checkout,'frontend');
const require=createRequire(path.join(frontend,'package.json'));
const ts=require('typescript');
const scratch=fs.mkdtempSync(path.join(os.tmpdir(),'kc-pilotdeploy-'));
fs.writeFileSync(path.join(scratch,'package.json'),'{"type":"module"}');
fs.symlinkSync(path.join(frontend,'node_modules'),path.join(scratch,'node_modules'),'dir');
const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const sourceFiles=[];
function compile(source) {
 const relative=path.relative(path.join(frontend,'src'),source), dest=path.join(scratch,relative.replace(/\.ts$/,'.js'));
 const original=fs.readFileSync(source,'utf8');sourceFiles.push({path:path.relative(checkout,source),sha256:hash(original)});
 let js=ts.transpileModule(original,{compilerOptions:{target:ts.ScriptTarget.ES2022,module:ts.ModuleKind.ES2022}}).outputText;
 js=js.replace(/((?:from\s*|import\s*\()\s*["'])(@\/lib\/[^"']+|\.[^"']+)(["'])/g,(all,start,spec,end)=>{
   let target=spec.startsWith('@/')?path.relative(path.dirname(dest),path.join(scratch,spec.slice(2))):spec;
   if(!target.startsWith('.'))target='./'+target;
   if(!path.extname(target))target+='.js';
   return start+target+end;
 });
 fs.mkdirSync(path.dirname(dest),{recursive:true});fs.writeFileSync(dest,js);
}
function walk(dir){for(const e of fs.readdirSync(dir,{withFileTypes:true})){const p=path.join(dir,e.name);if(e.isDirectory())walk(p);else if(e.name.endsWith('.ts')&&!e.name.endsWith('.test.ts')&&!e.name.endsWith('.d.ts'))compile(p);}}
walk(path.join(frontend,'src/lib/conversion'));walk(path.join(frontend,'src/lib/dsm-parser'));
const {buildGenericPackageArchive}=await import(pathToFileURL(path.join(scratch,'lib/conversion/package-service.js')));
const launcher=fs.readFileSync(path.join(checkout,'backend/app/assets/launcher/Deploy-Application.exe'));
const manifest=JSON.parse(fs.readFileSync(path.join(root,'app-packages.manifest.json'),'utf8'));
const commit=execFileSync('git',['-C',checkout,'rev-parse','HEAD'],{encoding:'utf8'}).trim();
const modified=execFileSync('git',['-C',checkout,'status','--porcelain','--','frontend/src/lib/conversion','frontend/src/lib/dsm-parser','backend/app/assets/launcher/Deploy-Application.exe'],{encoding:'utf8'}).trim();
const output=path.join(root,'.artifacts/packages');fs.mkdirSync(output,{recursive:true});
for(const p of manifest.packages){
 const installer=fs.readFileSync(path.join(root,'.artifacts/installers',p.installer_filename));
 const actual=hash(installer);
 if(p.publisher_sha256&&actual!==p.publisher_sha256)throw Error(`Hersteller-Pruefsumme abweichend: ${p.id}`);
 // PilotDeploy emits interpolated PowerShell strings; use its documented runtime variable.
 const uninstall=p.uninstall_command.replaceAll('%ProgramFiles%','$envProgramFiles');
 const result=await buildGenericPackageArchive({files:[{path:p.installer_filename,file:new File([installer],p.installer_filename)}],meta:{vendor:p.vendor,appName:p.name,version:p.version},packageOptions:{installArguments:p.install_arguments,uninstallCommand:uninstall,detectionHint:`Dateiversion: ${p.detection_path}, mindestens ${p.detection_version||p.version}`},launcherBlob:new Blob([launcher]),includeIntuneHelper:true});
 const name=`${p.id}-${p.version}-x64-r${p.revision}-PSADT.zip`, dest=path.join(output,name);
 fs.writeFileSync(dest,result.zipBytes);
 const provenance={created_at:new Date().toISOString(),created_with:'PilotDeploy: buildGenericPackageArchive (local source engine)',pilotdeploy_commit:commit,source_worktree_modified:!!modified,source_files:sourceFiles,launcher_sha256:hash(launcher),installer_sha256:actual,installer_source:p.source_url,archive_sha256:hash(result.zipBytes),assessment:result.assessment,windows_test:'pending',intune_test:'pending',redistribution:'pending'};
 fs.writeFileSync(path.join(output,`${p.id}-build.json`),JSON.stringify(provenance,null,2)+'\n');
 p.created_with=provenance.created_with;p.pilotdeploy_commit=commit;p.installer_sha256=actual;p.status='built_unreleased';p.local_artifacts=[{path:path.relative(root,dest),sha256:provenance.archive_sha256}];
 console.log(JSON.stringify({id:p.id,archive:name,bytes:result.zipBytes.length,readiness:result.assessment.readiness}));
}
fs.writeFileSync(path.join(root,'app-packages.manifest.json'),JSON.stringify(manifest,null,2)+'\n');
