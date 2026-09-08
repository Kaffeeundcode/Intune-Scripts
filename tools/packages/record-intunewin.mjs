import fs from 'node:fs';
import crypto from 'node:crypto';
const manifest=JSON.parse(fs.readFileSync('app-packages.manifest.json','utf8'));
const reports=JSON.parse(fs.readFileSync('validation/evidence/package-builds.json','utf8').replace(/^\uFEFF/,''));
const hash=file=>crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex');
for(const p of manifest.packages){
  const report=reports.find(r=>r.Package===`${p.id}-${p.version}`);
  if(!report||report.Packaging!=='passed')throw Error(`Missing build evidence: ${p.id}`);
  const zip=p.local_artifacts.find(a=>a.path.endsWith('-PSADT.zip'));
  const file=`.artifacts/packages/${p.id}-${p.version}-x64-r${p.revision}.intunewin`;
  if(hash(zip.path)!==report.SourceZipSHA256||hash(file)!==report.IntuneWinSHA256)throw Error(`Artifact mismatch: ${p.id}`);
  p.local_artifacts=p.local_artifacts.filter(a=>!a.path.endsWith('.intunewin'));
  p.local_artifacts.push({path:file,sha256:report.IntuneWinSHA256});
  p.intunewin_build={result:'passed',built_at:report.TestedAt,tool:'Microsoft Win32 Content Prep Tool',tool_version:report.ToolVersion,tool_sha256:report.ToolSHA256,evidence:'validation/evidence/package-builds.json'};
}
fs.writeFileSync('app-packages.manifest.json',JSON.stringify(manifest,null,2)+'\n');
console.log('Five final ZIP/INTUNEWIN pairs match the Windows build evidence.');
