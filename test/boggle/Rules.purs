module Test.Boggle.Rules where

import Prelude
import Boggle.Paths.Moves (Move(..))
import Boggle.Rules (bounded, noRepeat)
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testRules :: Effect Unit
testRules = do
  log "Running testRules"
  testNoRepeat
  testBounded

testNoRepeat :: Effect Unit
testNoRepeat = do
  assertEqual
    { actual: noRepeat []
    , expected: true
    }
  assertEqual
    { actual: noRepeat [R]
    , expected: true
    }
  assertEqual
    { actual: noRepeat [R, L]
    , expected: false
    }

testBounded :: Effect Unit
testBounded = do
  assertEqual
    { actual: bounded [] { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        bounded
          [ R ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        bounded
          [ R, L ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        bounded
          [ R, R ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: false
    }
  assertEqual
    { actual:
        bounded
          [ R, R, L, L ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: false
    }
