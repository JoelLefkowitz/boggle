import fs from "fs";
import Spellchecker from "hunspell-spellchecker";

const spellchecker = new Spellchecker();

const DICT = spellchecker.parse({
  aff: fs.readFileSync("src/dicts/en_US.aff"),
  dic: fs.readFileSync("src/dicts/en_US.dic"),
});

spellchecker.use(DICT);

export const isWord = (word) => spellchecker.check(word);
