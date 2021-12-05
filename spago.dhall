{ name = "purescript-boggle"
, version = "0.1.0"
, repository = "https://github.com/JoelLefkowitz/purescript-boggle"
, license = "MIT"
, dependencies =
    [ "arrays"
    , "console"
    , "effect"
    , "foldable-traversable"
    , "ordered-collections"
    , "prelude"
    , "strings"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
