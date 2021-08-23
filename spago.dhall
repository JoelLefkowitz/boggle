{ name = "my-project"
, dependencies = [ "assert"
  , "console"
  , "debug"
  , "effect"
  , "node-fs"
  , "ordered-collections"
  , "psci-support"
  , "strings"
  , "stringutils"
 ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
