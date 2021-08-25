module Test.Boggle.Paths.Coordinates where

import Prelude
import Boggle.Paths.Coordinates (cartesian, path, trace)
import Boggle.Paths.Moves (Move(..))
import Boggle.Utils.Matrices (Matrix(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testCoordinates :: Effect Unit
testCoordinates = do
  log "Running testCoordinates"
  testTrace
  testPath
  testCartesian

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

testPath :: Effect Unit
testPath = do
  assertEqual
    { actual:
        path (Dense 2 2 [ 1, 2, 3, 4 ]) 0
          [ { x: 0, y: 0 }
          ]
    , expected: [ 1 ]
    }
  assertEqual
    { actual:
        path (Dense 2 2 [ 1, 2, 3, 4 ]) 0
          [ { x: 0, y: 0 }
          , { x: 1, y: 1 }
          ]
    , expected: [ 1, 4 ]
    }
  assertEqual
    { actual:
        path (Dense 2 2 [ 1, 2, 3, 4 ]) 0
          [ { x: 0, y: 0 }
          , { x: 1, y: 1 }
          , { x: 2, y: 2 }
          ]
    , expected: [ 1, 4, 0 ]
    }

testCartesian :: Effect Unit
testCartesian = do
  assertEqual
    { actual: cartesian (Dense 2 2 [ 1, 2, 3, 4 ])
    , expected:
        [ { x: 0, y: 0 }
        , { x: 1, y: 0 }
        , { x: 0, y: 1 }
        , { x: 1, y: 1 }
        ]
    }
