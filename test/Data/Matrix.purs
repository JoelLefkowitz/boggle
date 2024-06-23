module Test.Data.Matrix where

import Prelude
import Test.Assert (assertEqual)
import Data.Matrix (Matrix(..), steps, points, paths)
import Effect (Effect)

empty :: Matrix Int
empty = Matrix []

testMatrix :: Effect Unit
testMatrix = do
  assertEqual
    { actual: show empty
    , expected: ""
    }
  assertEqual
    { actual: show $ Matrix [ [ 1 ] ]
    , expected: "│1│"
    }
  assertEqual
    { actual: show $ Matrix [ [ 1, 2 ], [ 3, 4 ] ]
    , expected: "│1, 2│\n│3, 4│"
    }
  assertEqual
    { actual: show $ Matrix [ [ 1, 2 ], [ 3 ] ]
    , expected: "│1, 2│\n│3, _│"
    }
  assertEqual
    { actual: points $ Matrix [ [ 1, 2 ], [ 3, 4 ] ]
    , expected:
        [ { x: 0, y: 0 }
        , { x: 0, y: 1 }
        , { x: 1, y: 0 }
        , { x: 1, y: 1 }
        ]
    }
  assertEqual
    { actual: steps (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) []
    , expected: []
    }
  assertEqual
    { actual: steps (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) [ { x: 0, y: 0 } ]
    , expected:
        [ [ { x: 0, y: 0 }, { x: 1, y: 0 } ]
        , [ { x: 0, y: 0 }, { x: 0, y: 1 } ]
        , [ { x: 0, y: 0 }, { x: 1, y: 1 } ]
        ]
    }
  assertEqual
    { actual: paths (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) 0
    , expected: []
    }
  assertEqual
    { actual: paths (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) 1
    , expected:
        [ [ { x: 0, y: 0 } ]
        , [ { x: 0, y: 1 } ]
        , [ { x: 1, y: 0 } ]
        , [ { x: 1, y: 1 } ]
        ]
    }
  assertEqual
    { actual: paths (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) 2
    , expected:
        [ [ { x: 0, y: 0 }, { x: 1, y: 0 } ]
        , [ { x: 0, y: 0 }, { x: 0, y: 1 } ]
        , [ { x: 0, y: 0 }, { x: 1, y: 1 } ]
        , [ { x: 0, y: 1 }, { x: 0, y: 0 } ]
        , [ { x: 0, y: 1 }, { x: 1, y: 0 } ]
        , [ { x: 0, y: 1 }, { x: 1, y: 1 } ]
        , [ { x: 1, y: 0 }, { x: 0, y: 0 } ]
        , [ { x: 1, y: 0 }, { x: 0, y: 1 } ]
        , [ { x: 1, y: 0 }, { x: 1, y: 1 } ]
        , [ { x: 1, y: 1 }, { x: 0, y: 0 } ]
        , [ { x: 1, y: 1 }, { x: 1, y: 0 } ]
        , [ { x: 1, y: 1 }, { x: 0, y: 1 } ]
        ]
    }
  assertEqual
    { actual: paths (Matrix [ [ 1, 2 ], [ 3, 4 ] ]) 5
    , expected: []
    }
