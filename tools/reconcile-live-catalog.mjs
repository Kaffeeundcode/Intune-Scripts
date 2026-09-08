// Read-only website snapshot files obtained through its public WordPress REST API.
import fs from 'node:fs';
import path from 'node:path';
const input=process.argv[2];
if(!input)throw Error('Usage: node tools/reconcile-live-catalog.mjs /directory/with/kc-wp-N.json');
const pages=Array.from({length:6},(_,i)=>JSON.parse(fs.readFileSync(path.join(input,`kc-wp-${i+1}.json`),'utf8'))).flat();
const manifest=JSON.parse(fs.readFileSync('library.manifest.json','utf8'));
const slug=e=>path.basename(e.path,'.ps1').toLowerCase();
const local=new Map(manifest.scripts.map(e=>[slug(e),e]));
const report={checked_at:new Date().toISOString(),source:'https://www.kaffeeundcode.com/wp-json/wp/v2/scripts',live_count:pages.length,matched_existing:pages.filter(p=>local.has(p.slug)).length,additional_live_entries:pages.filter(p=>!local.has(p.slug)).map(p=>({slug:p.slug,url:p.link,title:p.title.rendered,action:'Preserve existing page; not part of the current 510-script manifest.'})),new_scripts:manifest.scripts.filter(e=>!pages.some(p=>p.slug===slug(e))).map(e=>e.path)};
fs.writeFileSync('validation/evidence/website-reconciliation.json',JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({live:report.live_count,matched:report.matched_existing,additional:report.additional_live_entries.length,new:report.new_scripts.length}));
