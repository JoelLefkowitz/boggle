module Test.Boggle where

import Prelude
import Boggle (generateBoggle, verifyBoggle)
import Effect (Effect)
import Move (Move(..))
import Test.Assert (assertEqual)

testBoggle :: Effect Unit
testBoggle = do
  testVerifyBoggle
  testGenerateBoggle

testVerifyBoggle :: Effect Unit
testVerifyBoggle = do
  assertEqual
    { actual: verifyBoggle [ R ]
    , expected: true
    }
  assertEqual
    { actual: verifyBoggle [ R, L ]
    , expected: false
    }

testGenerateBoggle :: Effect Unit
testGenerateBoggle = do
  assertEqual
    { actual: generateBoggle 1 { r: 1, l: 1, u: 0, d: 0 }
    , expected: [ [ R ], [ L ] ]
    }
  assertEqual
    { actual: generateBoggle 2 { r: 1, l: 1, u: 0, d: 0 }
    , expected: []
    }
