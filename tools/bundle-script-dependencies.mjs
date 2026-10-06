import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {root} from '../script_catalog/tools/catalog.mjs';
const check=process.argv.includes('--check');
const manifest=JSON.parse(fs.readFileSync(path.join(root,'library.manifest.json'),'utf8'));
const sources={
  graph:{file:'Common/IntuneLibrary.psm1',match:/^Import-Module "\$PSScriptRoot\/\.\.\/Common\/IntuneLibrary\.psm1"\s*$/m},
  report:{file:'Common/IntuneReportLibrary.psm1',match:/^Import-Module "\$PSScriptRoot\/\.\.\/Common\/IntuneReportLibrary\.psm1"\s*$/m},
  teams:{file:'16_Teams_Telephony/000_TeamsTelephonyHelper.ps1',match:/^\. "\$PSScriptRoot\/000_TeamsTelephonyHelper\.ps1"\s*$/m}
};
let changed=0,bundleBlocks=0;const bundledScripts=new Set();
for(const entry of manifest.scripts){
  const file=path.join(root,entry.path),original=fs.readFileSync(file,'utf8');
  let text=original.replace(/^\uFEFF/,'').replace(/\r\n/g,'\n');
  for(const [kind,source] of Object.entries(sources)){
    const block=new RegExp(`^# kc-bundle:${kind}:start[^\\n]*\\n[\\s\\S]*?^# kc-bundle:${kind}:end`,'m');
    if(!block.test(text)&&!source.match.test(text))continue;
    const content=fs.readFileSync(path.join(root,source.file),'utf8').replace(/^\uFEFF/,'').replace(/\r\n/g,'\n');
    const digest=crypto.createHash('sha256').update(content).digest('hex');
    const code=kind==='graph'||kind==='report'
      ? `New-Module -Name ${kind==='graph'?'IntuneLibrary':'IntuneReportLibrary'} -ScriptBlock {\n${content}\n} | Import-Module -Scope Local -Force\n`
      : content.replace(/^<#[\s\S]*?#>\s*/,'');
    const replacement=`# kc-bundle:${kind}:start sha256=${digest}\n# Eingebettete Hilfslogik aus ${source.file}; durch tools/bundle-script-dependencies.mjs gepflegt.\n${code.trimEnd()}\n# kc-bundle:${kind}:end`;
    text=block.test(text)?text.replace(block,()=>replacement):text.replace(source.match,()=>replacement);
    text=text.replace('Benoetigt Common/IntuneLibrary.psm1 und Microsoft.Graph.Authentication.','Hilfslogik ist enthalten. Benoetigt Microsoft.Graph.Authentication.');
    bundleBlocks++;bundledScripts.add(entry.path);
  }
  // Windows PowerShell 5.1 reads non-ASCII help correctly when a UTF-8 BOM is present.
  text='\uFEFF'+text.replace(/[ \t]+$/gm,'');
  if(text!==original){changed++;if(!check)fs.writeFileSync(file,text);}
}
if(check&&changed)throw Error(`${changed} Skripte brauchen aktualisierte Hilfslogik/UTF-8-Kodierung.`);
console.log(JSON.stringify({scripts:manifest.scripts.length,bundled:bundledScripts.size,blocks:bundleBlocks,changed,check}));
