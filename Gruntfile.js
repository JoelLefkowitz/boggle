const { merge } = require("lodash");
const { simple } = require("quick-grunt");

const tasks = [
  {
    name: "lint",
    description: "Lint the source code.",
    exec: ["cspell", "eslint", "remark"],
  },
  {
    name: "format",
    description: "Format the source code.",
    exec: ["prettier", "alphabetize"],
  },
  {
    name: "test",
    description: "Compile and run unit tests.",
    exec: ["test"],
    copy: ["test"],
  },
  {
    name: "build",
    description: "Compile a production bundle.",
    exec: ["bundle"],
    copy: ["build"],
    clean: ["build"],
  },
];

const clean = {
  build: ["dist"],
};

const copyAll = (src, dest) => ({
  files: [{ expand: true, cwd: src, src: ["**"], dest }],
});

const copy = {
  build: copyAll("src/dicts", "dist/dicts"),
  test: copyAll("src/dicts", "output/Boggle.Solve/dicts"),
};

const linters = {
  cspell: 'npx cspell ".*" "*" "**/*"',
  eslint: 'npx esw "**/*.{js,jsx,ts,tsx}" --fix --ignore-path .gitignore',
  remark: "npx remark -r .remarkrc --ignore-path .gitignore . .github",
  missing: "conductor cspell words",
};

const formatters = {
  prettier: "npx prettier . --write --ignore-path .gitignore",
  alphabetize: "conductor cspell format",
};

const pulp = {
  test: "pulp test",
};

const spago = {
  bundle: "spago bundle-app --to dist/main.js",
  module: "spago bundle-module --to dist/main.js",
};

const exec = merge(linters, formatters, pulp, spago);

module.exports = simple({ clean, copy, exec }, tasks);
