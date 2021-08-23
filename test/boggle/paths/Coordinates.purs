module Test.Boggle.Paths.Coordinates where

import Prelude

import Boggle.Paths.Coordinates (trace)
import Boggle.Paths.Moves (Move(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testCoordinates :: Effect Unit
testCoordinates = do
  log "Running testCoordinates"
  testTrace

testTrace :: Effect Unit
testTrace = do
  assertEqual
    { actual: trace []
    , expected: [ { x: 0, y: 0 } ]
    }
  assertEqual
    { actual: trace [ R ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 } ]
    }
  assertEqual
    { actual: trace [ R, R ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 0 } ]
    }
  assertEqual
    { actual: trace [ R, UR ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 1 } ]
    }
  assertEqual
    { actual: trace [ R, UR, L ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 1 }, { x: 1, y: 1 } ]
    }
