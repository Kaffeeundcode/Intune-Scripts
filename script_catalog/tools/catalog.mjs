import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
export const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const labels = { unreviewed:'Ungeprüft', verified:'Geprüft', example:'Beispiel', known_issues:'Bekannte Fehler' };
const managedBlock = /\s*<!-- library-status:start -->[\s\S]*?<!-- library-status:end -->\s*/g;
export const sourceHash = text => crypto.createHash('sha256').update(text.replace(/^\uFEFF/,'').replace(managedBlock,'\n').replace(/\r\n/g,'\n')).digest('hex');
const read = p => fs.readFileSync(path.join(root,p),'utf8');
export const slugify = name => name.replace(/\.ps1$/i,'').replace(/^\d+_/,'').replace(/([a-z0-9])([A-Z])/g,'$1-$2').replace(/[^a-zA-Z0-9]+/g,'-').replace(/^-|-$/g,'').toLowerCase();
export function parseHelp(text) {
  const block=(text.match(/<#[\s\S]*?#>/)||[''])[0];
  const sections={}; let key='';
  for (const line of block.replace(/^<#|#>$/g,'').split(/\r?\n/)) {
    const match=line.match(/^\s*\.(SYNOPSIS|DESCRIPTION|EXAMPLE|PARAMETER|NOTES)\b\s*(.*)$/i);
    if (match) { key=match[1].toLowerCase(); (sections[key]||=[]).push(match[2]); }
    else if (key) sections[key].push(line.trimEnd());
  }
  return Object.fromEntries(Object.entries(sections).map(([k,v])=>[k,v.join('\n').trim()]));
}
export function verificationProblems(entry,hash,base=root,now=new Date()) {
  const required=entry.path.includes('03_Intune_Remediations/')||entry.execution_context==='local'
    ? ['static','pester','windows']:['static','pester','windows','tenant'];
  return required.filter(kind=>!(entry.evidence||[]).some(e=>{
    if (e.kind!==kind||e.result!=='passed'||e.source_sha256!==hash) return false;
    if (!e.artifact||path.isAbsolute(e.artifact)||e.artifact.split(/[\\/]/).includes('..')) return false;
    const file=path.join(base,e.artifact),date=new Date(e.tested_at);
    if (!fs.existsSync(file)||!e.artifact_sha256) return false;
    const actual=crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex');
    return actual===e.artifact_sha256&&Number.isFinite(+date)&&date<=now&&now-date<=183*86400000;
  })).map(kind=>`${kind}: aktueller erfolgreicher Nachweis fehlt`);
}
function scriptFiles() {
  return fs.readdirSync(root,{withFileTypes:true}).filter(d=>d.isDirectory()&&/^\d\d_/.test(d.name)&&d.name!=='18_App_Packages')
    .flatMap(d=>fs.readdirSync(path.join(root,d.name)).filter(f=>f.endsWith('.ps1')&&!f.startsWith('000_')).map(f=>`${d.name}/${f}`)).sort();
}
function render(e) {
  const dependencies=e.dependencies.map(p=>`[${path.basename(p)}](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/${p})`).join(', ')||'Keine lokale Hilfsdatei erkannt.';
  return `# ${e.title_de}\n\n**Prüfstatus: ${e.status_label}**\n\n${e.synopsis}\n\n${e.description}\n\n## Prüfung\n\n${e.notes.map(n=>`- ${n}`).join('\n')||'Keine fachliche Freigabe aus der Katalogerstellung ableiten.'}\n\n${e.verification_gaps.map(x=>`- ${x}`).join('\n')}\n\n${e.canonical_path!==e.source_path?`Gleiche Implementierung: [Hauptversion](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/${e.canonical_path}).\n\n`:''}## Voraussetzungen\n\n- Module: ${e.modules.join(', ')||'Skript prüfen; keine Cloud-Module erkannt.'}\n- Dokumentierte Graph-Scopes: ${e.graph_scopes.join(', ')||'Nicht angegeben; vor Tenant-Nutzung prüfen.'}\n- Hilfsdateien: ${dependencies}\n\n## Verwendung\n\n${e.example?`\`\`\`powershell\n${e.example}\n\`\`\``:`Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit \`Get-Help './${e.source_path}' -Full\` lesen.`}\n\n## Quelle\n\n[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/${e.source_path})\n\nPrüfungen gelten nur für den dokumentierten Quellstand und Testumfang.\n`;
}
export function buildCatalog() {
  const manifest=JSON.parse(read('library.manifest.json'));
  const byPath=new Map(manifest.scripts.map(e=>[e.path,e]));
  if (byPath.size!==manifest.scripts.length) throw Error('Doppelte Manifestpfade.');
  const files=scriptFiles();
  const missing=files.filter(p=>!byPath.has(p)),stale=[...byPath.keys()].filter(p=>!files.includes(p));
  if (missing.length||stale.length) throw Error(`Manifestabweichung: neu=${missing}; fehlt=${stale}`);
  const slugs=new Set();
  const entries=files.map(p=>{
    const meta=byPath.get(p),text=read(p),help=parseHelp(text),hash=sourceHash(text);
    if (!labels[meta.status]||!byPath.has(meta.canonical_path)) throw Error(`Status/Hauptversion ungültig: ${p}`);
    const gaps=verificationProblems(meta,hash);
    if (meta.status==='verified'&&gaps.length) throw Error(`Unbelegte Freigabe: ${p}: ${gaps.join('; ')}`);
    const slug=slugify(path.basename(p));
    if (slugs.has(slug)) throw Error(`Slug-Kollision: ${slug}`);
    slugs.add(slug);
    const modules=[],dependencies=[];
    if (/Get-Mg|Connect-Mg|Connect-IlGraph/.test(text)) modules.push('Microsoft.Graph.Authentication');
    if (/Get-Mg(?!Context)|New-Mg|Remove-Mg|Update-Mg/.test(text)) modules.push('Microsoft.Graph (passende SDK-Untermodule)');
    if (/Get-Cs|Ensure-TtCommand/.test(text)) modules.push('MicrosoftTeams');
    if (/Get-Az|Connect-Az/.test(text)) modules.push('Az');
    if (/Get-EXO|Connect-ExchangeOnline|Get-Mailbox/.test(text)) modules.push('ExchangeOnlineManagement');
    if (text.includes('000_TeamsTelephonyHelper.ps1')&&!text.includes('# kc-bundle:teams:start')) dependencies.push('16_Teams_Telephony/000_TeamsTelephonyHelper.ps1');
    if (text.includes('IntuneLibrary.psm1')&&!text.includes('# kc-bundle:graph:start')) dependencies.push('Common/IntuneLibrary.psm1');
    const scopes=[...text.matchAll(/["']([A-Z][A-Za-z.]+\.(?:Read|ReadWrite|PrivilegedOperations)\.All)["']/g)].map(m=>m[1]);
    const e={slug,script_name:path.basename(p),source_path:p,category:p.split('/')[0],title_de:path.basename(p).replace(/^\d+_|\.ps1$/g,''),
      synopsis:help.synopsis||path.basename(p),description:help.description||'Beschreibung ausstehend.',example:help.example||'',
      status:meta.status,status_label:labels[meta.status],review_group:meta.review_group,review_wave:meta.review_wave,is_new:meta.is_new||false,
      recommended:meta.status==='verified'&&meta.review_wave!==null,canonical_path:meta.canonical_path,notes:meta.notes,evidence:meta.evidence,
      verification_gaps:gaps,source_sha256:hash,modules,graph_scopes:[...new Set(scopes)],dependencies,
      risk_level:/\b(?:Remove|Wipe|Retire|Restart|Set|New|Update|Clear|Disable|Revoke|Assign|Repair|Remediate)-/.test(text.replace(/<#[\s\S]*?#>/g,''))?'elevated':'normal'};
    e.content_de=render(e);return e;
  });
  return {manifest,entries};
}
export function generate(check=false) {
  const {manifest,entries}=buildCatalog(),outputs=new Map(),json=d=>JSON.stringify(d,null,2)+'\n';
  outputs.set('scripts.generated.json',json(entries));
  const cols=['slug','title_de','content_de','category','source_path','status','status_label','recommended','risk_level'];
  outputs.set('scripts.cms-import.csv',cols.join(',')+'\n'+entries.map(e=>cols.map(k=>'"'+String(e[k]??'').replaceAll('"','""')+'"').join(',')).join('\n')+'\n');
  for (const e of entries) outputs.set(`pages/${e.slug}.md`,e.content_de);
  const canonical=new Set(entries.map(e=>e.canonical_path)).size;
  const counts=Object.fromEntries(Object.keys(labels).map(s=>[s,entries.filter(e=>e.status===s).length]));
  const selected=entries.filter(e=>e.review_wave===1||e.review_wave===2);
  for (const [group,count] of Object.entries(manifest.review_groups)) if (selected.filter(e=>e.review_group===group).length!==count) throw Error(`Auswahlquote verletzt: ${group}`);
  outputs.set('README.md',`# PowerShell-Bibliothek\n\n${entries.length} Skripteinträge; ${canonical} Implementierungen nach dokumentierter Varianten-Zuordnung. Hilfsdateien und App-Pakete werden getrennt gezählt.\n\n## Prüfstatus\n\n${Object.entries(counts).map(([s,n])=>`- ${labels[s]}: ${n}`).join('\n')}\n\n100 vorhandene Skripte sind für die erste Abnahme ausgewählt. Auswahl bedeutet noch keine Empfehlung oder Freigabe.\n\n## Intune zuerst\n\n${selected.sort((a,b)=>(a.review_group==='teams')-(b.review_group==='teams')||a.source_path.localeCompare(b.source_path)).map(e=>`- [${e.title_de}](pages/${e.slug}.md) — ${e.status_label}`).join('\n')}\n\n## Vollständiger Bestand\n\n${entries.map(e=>`- [${e.title_de}](pages/${e.slug}.md) — ${e.status_label}`).join('\n')}\n`);
  outputs.set('quality-report.md',`# Katalog- und Prüfbericht\n\n- Skripteinträge: ${entries.length}\n- Unterschiedliche Implementierungen laut Manifest: ${canonical}\n- Erste Auswahl: ${selected.length}\n- Weitere Bestandskandidaten: ${entries.filter(e=>e.review_wave===3&&!e.is_new).length}\n- Geprüft: ${counts.verified}\n- Beispiele: ${counts.example}\n- Bekannte Fehler: ${counts.known_issues}\n\nDie Katalogprüfung validiert Pfade, Auswahlquoten, eindeutige Seiten und Nachweise. Sie beweist keine Windows- oder Tenant-Funktion.\n\n## Bekannte Fehler und Beispiele\n\n${entries.filter(e=>['known_issues','example'].includes(e.status)).map(e=>`- ${e.source_path}: ${e.notes.join('; ')}`).join('\n')}\n`);
  const base=path.join(root,'script_catalog'),diffs=[];
  for (const [file,content] of outputs) {
    const dest=path.join(base,file);
    if (!fs.existsSync(dest)||fs.readFileSync(dest,'utf8')!==content) {
      diffs.push(file);if (!check) {fs.mkdirSync(path.dirname(dest),{recursive:true});fs.writeFileSync(dest,content);}
    }
  }
  const index=path.join(base,'generated-files.json'),previous=fs.existsSync(index)?JSON.parse(fs.readFileSync(index,'utf8')):[];
  for (const old of previous) if (!outputs.has(old)&&!old.includes('..')&&old.startsWith('pages/')) {
    diffs.push(old);if (!check&&fs.existsSync(path.join(base,old)))fs.unlinkSync(path.join(base,old));
  }
  if (!check) fs.writeFileSync(index,json([...outputs.keys()]));
  if (check&&diffs.length) throw Error(`Katalog veraltet (${diffs.length} Dateien). npm run catalog ausführen.`);
  return {entries:entries.length,canonical,counts,changed:diffs.length};
}
