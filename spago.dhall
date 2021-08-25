{ name = "boggle"
, dependencies =
  [ "assert"
  , "console"
  , "debug"
  , "effect"
  , "linear-algebra"
  , "node-fs"
  , "ordered-collections"
  , "psci-support"
  , "strings"
  , "stringutils"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
