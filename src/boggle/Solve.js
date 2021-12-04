'use strict';

const fs = require('fs');
const path = require('path');
const Spellchecker = require('hunspell-spellchecker');

const spellchecker = new Spellchecker();

const dicts = path.join(__dirname, 'dicts');

const DICT = spellchecker.parse({
  aff: fs.readFileSync(path.join(dicts, 'en_US.aff')),
  dic: fs.readFileSync(path.join(dicts, 'en_US.dic')),
});

spellchecker.use(DICT);

exports.isWord = function (word) {
  return spellchecker.check(word);
};
