module Test.Boggle.Utils.Matrices where

import Prelude
import Boggle.Utils.Matrices (Matrix(..), elem, fit, fromArray, pad, toChain)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Test.Assert (assertEqual)

testMatrices :: Effect Unit
testMatrices = do
  log "Running testMatrices"
  testPad
  testFit
  testToChain
  testFromArray
  testElem

testPad :: Effect Unit
testPad = do
  assertEqual
    { actual: pad 1 [] 0
    , expected: [ 0 ]
    }
  assertEqual
    { actual: pad 1 [ 1, 2 ] 0
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: pad 3 [ 1, 2 ] 0
    , expected: [ 1, 2, 0 ]
    }

testFit :: Effect Unit
testFit = do
  assertEqual
    { actual: fit 1 [] 0
    , expected: [ 0 ]
    }
  assertEqual
    { actual: fit 1 [ 1, 2 ] 0
    , expected: [ 1 ]
    }
  assertEqual
    { actual: fit 3 [ 1, 2 ] 0
    , expected: [ 1, 2, 0 ]
    }

testToChain :: Effect Unit
testToChain = do
  assertEqual
    { actual: toChain 2 2 [] 0
    , expected: [ [ 0, 0 ], [ 0, 0 ] ]
    }
  assertEqual
    { actual: toChain 2 2 [ [ 1, 2 ], [ 3, 4 ] ] 0
    , expected: [ [ 1, 2 ], [ 3, 4 ] ]
    }
  assertEqual
    { actual: toChain 1 1 [ [ 1, 2 ], [ 3, 4 ] ] 0
    , expected: [ [ 1 ] ]
    }
  assertEqual
    { actual: toChain 2 2 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: [ [ 1, 2 ], [ 3, 0 ] ]
    }
  assertEqual
    { actual: toChain 2 3 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: [ [ 1, 2, 0 ], [ 3, 0, 0 ] ]
    }
  assertEqual
    { actual: toChain 3 2 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: [ [ 1, 2 ], [ 3, 0 ], [ 0, 0 ] ]
    }

testFromArray :: Effect Unit
testFromArray = do
  assertEqual
    { actual: fromArray 0 0 [ [ 1 ] ] 0
    , expected: Dense 0 0 []
    }
  assertEqual
    { actual: fromArray 2 2 [] 0
    , expected: Dense 2 2 [ 0, 0, 0, 0 ]
    }
  assertEqual
    { actual: fromArray 2 2 [ [ 1, 2 ], [ 3, 4 ] ] 0
    , expected: Dense 2 2 [ 1, 2, 3, 4 ]
    }
  assertEqual
    { actual: fromArray 1 1 [ [ 1, 2 ], [ 3, 4 ] ] 0
    , expected: Dense 1 1 [ 1 ]
    }
  assertEqual
    { actual: fromArray 2 2 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: Dense 2 2 [ 1, 2, 3, 0 ]
    }
  assertEqual
    { actual: fromArray 2 3 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: Dense 2 3 [ 1, 2, 0, 3, 0, 0 ]
    }
  assertEqual
    { actual: fromArray 3 2 [ [ 1, 2 ], [ 3 ] ] 0
    , expected: Dense 3 2 [ 1, 2, 3, 0, 0, 0 ]
    }

testElem :: Effect Unit
testElem = do
  assertEqual
    { actual: elem 1 1 (Dense 1 1 [ 1 ])
    , expected: Nothing
    }
  assertEqual
    { actual: elem 0 0 (Dense 2 2 [ 1, 2, 3, 4 ])
    , expected: Just 1
    }
  assertEqual
    { actual: elem 1 1 (Dense 2 2 [ 1, 2, 3, 4 ])
    , expected: Just 4
    }
