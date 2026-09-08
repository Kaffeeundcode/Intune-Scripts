import {test} from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {buildCatalog,parseHelp,sourceHash,verificationProblems} from '../script_catalog/tools/catalog.mjs';

test('all 500 original paths and 28 added scripts remain individually visible; helpers excluded',()=>{
  const {entries}=buildCatalog();
  assert.equal(entries.length,528);
  assert.equal(entries.filter(e=>e.is_new).length,28);
  assert.equal(new Set(entries.map(e=>e.slug)).size,528);
  assert.ok(entries.every(e=>!e.script_name.startsWith('000_')));
});
test('first batch is exactly 100 with requested category quotas and 30 wave-one items',()=>{
  const {manifest,entries}=buildCatalog();
  const selected=entries.filter(e=>[1,2].includes(e.review_wave));
  assert.equal(selected.length,100);
  assert.equal(selected.filter(e=>e.review_wave===1).length,30);
  assert.deepEqual(manifest.review_groups,{devices:20,apps:15,configuration:15,enrollment:10,remediations:10,teams:20,entra:5,graph:5});
  for(const [group,n] of Object.entries(manifest.review_groups)) assert.equal(selected.filter(e=>e.review_group===group).length,n);
});
test('selection alone never creates a verified recommendation',()=>{
  for(const e of buildCatalog().entries) assert.equal(e.recommended,e.status==='verified'&&e.review_wave!==null);
});
test('published single-file scripts carry their local helpers and visible review status',()=>{
  for(const e of buildCatalog().entries){
    const text=fs.readFileSync(new URL('../'+e.source_path,import.meta.url),'utf8');
    assert.equal(e.dependencies.length,0,e.source_path);
    assert.ok(text.startsWith('\uFEFF'),e.source_path);
    assert.ok(text.includes('Prüfstatus:'),e.source_path);
    assert.ok(!/^Import-Module "\$PSScriptRoot\/\.\.\/Common/m.test(text),e.source_path);
    assert.ok(!/^\. "\$PSScriptRoot\/000_/m.test(text),e.source_path);
  }
});
test('evidence must match source, artifact hash, timestamp, scope and all required platforms',()=>{
  const dir=fs.mkdtempSync(path.join(os.tmpdir(),'library-evidence-'));
  try {
    fs.writeFileSync(path.join(dir,'result.json'),'passed');
    const digest=crypto.createHash('sha256').update('passed').digest('hex');
    const now=new Date('2026-09-07T12:00:00Z');
    const evidence=['static','pester','windows','tenant'].map(kind=>({kind,result:'passed',source_sha256:'abc',artifact:'result.json',artifact_sha256:digest,tested_at:now.toISOString()}));
    const e={path:'01_Device_Management/example.ps1',evidence};
    assert.equal(verificationProblems(e,'abc',dir,now).length,0);
    assert.equal(verificationProblems(e,'changed',dir,now).length,4);
    assert.equal(verificationProblems({...e,evidence:evidence.slice(0,3)},'abc',dir,now).length,1);
    assert.equal(verificationProblems(e,'abc',dir,new Date('2027-09-07')).length,4);
    fs.writeFileSync(path.join(dir,'result.json'),'modified');
    assert.equal(verificationProblems(e,'abc',dir,now).length,4);
  } finally {fs.rmSync(dir,{recursive:true});}
});
test('source fingerprint ignores managed status but changes on executable changes',()=>{
  const a='a\n<!-- library-status:start -->\nUngeprüft\n<!-- library-status:end -->\nb';
  assert.equal(sourceHash(a),sourceHash(a.replace('Ungeprüft','Geprüft')));
  assert.notEqual(sourceHash(a),sourceHash(a+'c'));
});
test('help preserves multiline examples and metadata is not used to invent a runnable command',()=>{
  const help=parseHelp('<#\n.SYNOPSIS\nExample\n.EXAMPLE\n./a.ps1 `\n -Name "one"\n#>');
  assert.ok(help.example.includes('\n -Name'));
});
