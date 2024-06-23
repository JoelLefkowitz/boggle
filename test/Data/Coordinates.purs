module Test.Data.Coordinates where

import Prelude
import Data.Coordinates (adjacent, next)
import Effect (Effect)
import Test.Assert (assertEqual)

testCoordinates :: Effect Unit
testCoordinates = do
  assertEqual
    { actual: adjacent { x: 0, y: 0 }
    , expected:
        [ { x: -1, y: -1 }
        , { x: 0, y: -1 }
        , { x: 1, y: -1 }
        , { x: -1, y: 0 }
        , { x: 1, y: 0 }
        , { x: -1, y: 1 }
        , { x: 0, y: 1 }
        , { x: 1, y: 1 }
        ]
    }
  assertEqual
    { actual: next []
    , expected: []
    }
  assertEqual
    { actual: next [ { x: 0, y: 0 } ]
    , expected: adjacent { x: 0, y: 0 }
    }
