import fs from 'node:fs';
import path from 'node:path';
import {root,sourceHash,verificationProblems} from '../script_catalog/tools/catalog.mjs';
const manifest=JSON.parse(fs.readFileSync(path.join(root,'library.manifest.json'),'utf8'));
const labels={unreviewed:'Ungeprüft',verified:'Geprüft',example:'Beispiel',known_issues:'Bekannte Fehler'};
for (const e of manifest.scripts) {
  const file=path.join(root,e.path); let text=fs.readFileSync(file,'utf8');
  if (e.status==='verified'&&verificationProblems(e,sourceHash(text)).length) throw Error(`Unbelegte Freigabe: ${e.path}`);
  // The existing WordPress importer treats dot+word as the next help section.
  // Encode dots only in managed metadata so filenames cannot truncate the description.
  const notes=(e.notes.join(' ')||'Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.').replace(/\.(?=\w)/g,'&#46;');
  const canonical=e.canonical_path!==e.path?`Hauptversion: ${e.canonical_path.replace(/\.(?=\w)/g,'&#46;')}`:'';
  const body=`<!-- library-status:start -->\n    Prüfstatus: ${labels[e.status]}\n    ${notes}\n    ${canonical}\n    <!-- library-status:end -->`;
  if (/<!-- library-status:start -->/.test(text)) text=text.replace(/<!-- library-status:start -->[\s\S]*?<!-- library-status:end -->/,body);
  else if (/\.DESCRIPTION\b/.test(text)) text=text.replace(/\.DESCRIPTION\s*\n/,`.DESCRIPTION\n    ${body}\n\n`);
  else text=text.replace(/#>/,`.DESCRIPTION\n    ${body}\n#>`);
  fs.writeFileSync(file,text.replace(/[ \t]+$/gm,''));
}
console.log(`Prüfstatus in ${manifest.scripts.length} Skripthilfen synchronisiert.`);
