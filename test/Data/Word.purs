module Test.Data.Word where

import Prelude
import Effect (Effect)
import Data.Word (boggle)
import Test.Assert (assertEqual)
import Data.Matrix (Matrix(..))

testWord :: Effect Unit
testWord = do
  assertEqual
    { actual: boggle (Matrix [ [ "a", "b" ], [ "c", "d" ] ]) 4
    , expected:
        [ { path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 0 } ], word: "cab" }
        , { path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 1 } ], word: "cad" }
        , { path: [ { x: 1, y: 0 }, { x: 0, y: 0 }, { x: 1, y: 1 } ], word: "bad" }
        , { path: [ { x: 1, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 0 } ], word: "dab" }
        ]
    }
  assertEqual
    { actual: boggle (Matrix [ [ "a", "b", "c" ], [ "d", "e", "f" ], [ "g", "h", "i" ] ]) 9
    , expected:
        [ { word: "dab", path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 1, y: 0 } ] }
        , { word: "dag", path: [ { x: 0, y: 1 }, { x: 0, y: 0 }, { x: 0, y: 2 } ] }
        , { word: "deb", path: [ { x: 0, y: 1 }, { x: 1, y: 1 }, { x: 1, y: 0 } ] }
        , { word: "deg", path: [ { x: 0, y: 1 }, { x: 1, y: 1 }, { x: 0, y: 2 } ] }
        , { word: "bad", path: [ { x: 1, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 1 } ] }
        , { word: "bed", path: [ { x: 1, y: 0 }, { x: 1, y: 1 }, { x: 0, y: 1 } ] }
        , { word: "hid", path: [ { x: 1, y: 2 }, { x: 2, y: 2 }, { x: 0, y: 1 } ] }
        , { word: "hie", path: [ { x: 1, y: 2 }, { x: 2, y: 2 }, { x: 1, y: 1 } ] }
        , { word: "fib", path: [ { x: 2, y: 1 }, { x: 2, y: 2 }, { x: 1, y: 0 } ] }
        , { word: "fie", path: [ { x: 2, y: 1 }, { x: 2, y: 2 }, { x: 1, y: 1 } ] }
        , { word: "abed", path: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 1, y: 1 }, { x: 0, y: 1 } ] }
        , { word: "bade", path: [ { x: 1, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 1 }, { x: 1, y: 1 } ] }
        , { word: "bead", path: [ { x: 1, y: 0 }, { x: 1, y: 1 }, { x: 0, y: 0 }, { x: 0, y: 1 } ] }
        , { word: "each", path: [ { x: 1, y: 1 }, { x: 0, y: 0 }, { x: 2, y: 0 }, { x: 1, y: 2 } ] }
        , { word: "egad", path: [ { x: 1, y: 1 }, { x: 0, y: 2 }, { x: 0, y: 0 }, { x: 0, y: 1 } ] }
        , { word: "hide", path: [ { x: 1, y: 2 }, { x: 2, y: 2 }, { x: 0, y: 1 }, { x: 1, y: 1 } ] }
        , { word: "hied", path: [ { x: 1, y: 2 }, { x: 2, y: 2 }, { x: 1, y: 1 }, { x: 0, y: 1 } ] }
        , { word: "fiche", path: [ { x: 2, y: 1 }, { x: 2, y: 2 }, { x: 2, y: 0 }, { x: 1, y: 2 }, { x: 1, y: 1 } ] }
        ]
    }
