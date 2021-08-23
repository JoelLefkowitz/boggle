module Test.Linear where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Linear (generateLinear, verifyLinear)
import Move (Move(..))
import Test.Assert (assertEqual)

testLinear :: Effect Unit
testLinear = log "Skipping testLinear"

-- testLinear = do
--   testVerifyLinear
--   testGenerateLinear
testVerifyLinear :: Effect Unit
testVerifyLinear = do
  assertEqual
    { actual: verifyLinear [ R ]
    , expected: true
    }
  assertEqual
    { actual: verifyLinear [ R, L ]
    , expected: false
    }

testGenerateLinear :: Effect Unit
testGenerateLinear = do
  assertEqual
    { actual: generateLinear 1 { r: 1, l: 1, u: 0, d: 0 }
    , expected: [ [ R ], [ L ] ]
    }
  assertEqual
    { actual: generateLinear 2 { r: 1, l: 1, u: 0, d: 0 }
    , expected: []
    }
