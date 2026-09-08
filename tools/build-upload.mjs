import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {buildCatalog,sourceHash} from '../script_catalog/tools/catalog.mjs';
const {entries}=buildCatalog();
const out=path.resolve('.artifacts/upload');fs.mkdirSync(out,{recursive:true});
const root=process.cwd();
const files=execFileSync('git',['ls-files','--cached','--others','--exclude-standard','-z'],{encoding:'utf8'}).split('\0').filter(Boolean);
const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
for(const file of files){
  if(path.isAbsolute(file)||file.split('/').includes('..')||file.startsWith('.artifacts/')||/(^|\/)\.env($|\.)|\.(exe|intunewin|zip|pfx|pem|key)$/i.test(file))throw Error(`Unexpected upload file: ${file}`);
}
const inventory={generated_at:new Date().toISOString(),script_count:entries.length,source_scripts:entries.map(e=>({path:e.source_path,source_sha256:sourceHash(fs.readFileSync(e.source_path,'utf8')),status:e.status})),files:files.map(p=>({path:p,bytes:fs.statSync(p).size,sha256:hash(fs.readFileSync(p))}))};
const staging=fs.mkdtempSync(path.join(out,'source-'));
for(const p of files){const target=path.join(staging,p);fs.mkdirSync(path.dirname(target),{recursive:true});fs.copyFileSync(p,target);}
fs.writeFileSync(path.join(staging,'UPLOAD-INVENTORY.json'),JSON.stringify(inventory,null,2)+'\n');
const archive=path.join(out,'KaffeeundCode-GitHub-Upload-2026-09-08.zip');
// Create a fresh archive; an earlier build is retained as a timestamped backup.
if(fs.existsSync(archive))fs.renameSync(archive,archive+`.previous-${Date.now()}`);
execFileSync('zip',['-qr',archive,'.'],{cwd:staging});
execFileSync('unzip',['-tqq',archive]);
const report={archive:path.relative(root,archive),sha256:hash(fs.readFileSync(archive)),bytes:fs.statSync(archive).size,files:files.length+1,scripts:entries.length,tenant_validation:'not_performed',app_binaries_included:false};
fs.writeFileSync(path.join(out,'upload-report.json'),JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report,null,2));
