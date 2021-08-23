module Test.Boggle.Utils.NonEmpty where

import Prelude hiding (min, max)
import Boggle.Utils.NonEmpty (last, max, min, default, tare, prior)
import Data.Array.NonEmpty (cons', singleton)
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testNonEmpty :: Effect Unit
testNonEmpty = do
  log "Running testNonEmpty"
  testLast
  testMax
  testMin
  testDefault
  testTare
  testPrior

testLast :: Effect Unit
testLast = do
  assertEqual
    { actual: last $ singleton 1
    , expected: 1
    }
  assertEqual
    { actual: last $ cons' 1 [ 2, 3 ]
    , expected: 3
    }

testMax :: Effect Unit
testMax = do
  assertEqual
    { actual: max $ cons' 1 [ 2, 3 ]
    , expected: 3
    }

testMin :: Effect Unit
testMin = do
  assertEqual
    { actual: min $ cons' 1 [ 2, 3 ]
    , expected: 1
    }

testDefault :: Effect Unit
testDefault = do
  assertEqual
    { actual: default [ 1, 2, 3 ] 0
    , expected: cons' 0 [ 1, 2, 3 ]
    }

testTare :: Effect Unit
testTare = do
  assertEqual
    { actual: tare $ [ 1, 2, 3 ]
    , expected: cons' 0 [ 1, 2, 3 ]
    }

testPrior :: Effect Unit
testPrior = do
  assertEqual
    { actual: prior $ singleton 5
    , expected: cons' 0 [ 1, 2, 3, 4, 5 ]
    }
