'use strict';

const fs = require('fs');

var Spellchecker = require('hunspell-spellchecker');
var spellchecker = new Spellchecker();

var DICT = spellchecker.parse({
  aff: fs.readFileSync('./en_EN.aff'),
  dic: fs.readFileSync('./en_EN.dic'),
});

spellchecker.use(DICT);

exports.isWord = (word) => spellchecker.check(word);
