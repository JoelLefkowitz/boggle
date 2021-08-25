let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.3-20210811/packages.dhall sha256:a2de7ef2f2e753733eddfa90573a82da0c7c61d46fa87d015b7f15ef8a6e97d5
in  upstream
  with linear-algebra =
    { dependencies =
        [ 
        "prelude",
        "arrays",
        "globals",
        "tuples"
        ]
    , repo = "https://github.com/klangner/purescript-linear-algebra.git"
    , version = "v0.5.0"
    }
  with globals =
    { dependencies =
        [ 
        "prelude"
        ]
    , repo = "https://github.com/purescript-deprecated/purescript-globals.git"
    , version = "v5.0.0"
    }
