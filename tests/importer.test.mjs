import fs from 'node:fs';
import path from 'node:path';
import {test} from 'node:test';
import assert from 'node:assert/strict';
const manifest=JSON.parse(fs.readFileSync('library.manifest.json','utf8'));
test('existing PHP import description extraction receives a visible review status',()=>{
  for(const e of manifest.scripts){
    const text=fs.readFileSync(e.path,'utf8');
    const description=text.match(/\.DESCRIPTION\s*([\s\S]*?)(?=\.\w+|$)/)?.[1];
    assert.ok(description?.includes('Prüfstatus:'),e.path);
  }
});
test('the one-subfolder importer sees library files, preserved helper and five app descriptions only',()=>{
  const seen=[];
  for(const dir of fs.readdirSync('.',{withFileTypes:true}).filter(d=>d.isDirectory()&&!d.name.startsWith('.'))){
    for(const entry of fs.readdirSync(dir.name,{withFileTypes:true})){
      const p=path.join(dir.name,entry.name);
      if(entry.isFile()&&p.endsWith('.ps1'))seen.push(p);
      if(entry.isDirectory()){
        const children=fs.readdirSync(p);
        if(children.some(n=>n.toLowerCase()==='readme.md'||n.endsWith('.ps1')))seen.push(p);
      }
    }
  }
  const expected=[...manifest.scripts.map(e=>e.path),'16_Teams_Telephony/000_TeamsTelephonyHelper.ps1',...['7zip','notepadplusplus','vlc','git','powertoys'].map(id=>'18_App_Packages/'+id)];
  assert.deepEqual(seen.sort(),expected.sort());
});
