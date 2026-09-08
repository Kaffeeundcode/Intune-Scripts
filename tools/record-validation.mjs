import fs from 'node:fs';
import crypto from 'node:crypto';
import {buildCatalog} from '../script_catalog/tools/catalog.mjs';
const reports=['local-unit-tests.json','windows-unit-tests.json','psscriptanalyzer.json'];
const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const artifacts=reports.map(name=>{
  const file='validation/evidence/'+name;
  const bytes=fs.readFileSync(file),report=JSON.parse(bytes.toString('utf8').replace(/^\uFEFF/,''));
  if(name.includes('unit-tests')&&(report.Result!=='Passed'||report.Failed||report.SyntaxErrors.length))throw Error(`Tests failed: ${name}`);
  if(name==='psscriptanalyzer.json'&&report.Errors)throw Error('Static errors remain.');
  return {path:file,sha256:hash(bytes),tested_at:report.TestedAt,powershell:report.PowerShell};
});
const result={recorded_at:new Date().toISOString(),scope:'All 510 scripts parsed; Pester covers shared Graph/Teams behavior and selected workflows. No blanket functional or tenant approval. Managed review comments are excluded from executable source fingerprints.',artifacts,scripts:buildCatalog().entries.map(e=>({path:e.source_path,source_sha256:e.source_sha256}))};
fs.writeFileSync('validation/evidence/tested-sources.json',JSON.stringify(result,null,2)+'\n');
console.log('Recorded source fingerprints and report hashes; no review status promoted.');
