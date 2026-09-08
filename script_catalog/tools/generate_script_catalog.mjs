import { generate } from './catalog.mjs';
console.log(JSON.stringify(generate(process.argv.includes('--check')), null, 2));
