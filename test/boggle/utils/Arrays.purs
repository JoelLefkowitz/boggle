module Test.Boggle.Utils.Arrays where

import Prelude
import Boggle.Utils.Arrays (fill, range, shift, unique)
import Effect (Effect)
import Effect.Class.Console (log)
import Test.Assert (assertEqual)

testArrays :: Effect Unit
testArrays = do
  log "Running testArrays"
  testShift
  testRange
  testFill
  testUnique

testShift :: Effect Unit
testShift = do
  assertEqual
    { actual: shift 1 [ 1, 2, 3 ]
    , expected: [ 2, 3, 4 ]
    }

testRange :: Effect Unit
testRange = do
  assertEqual
    { actual: range 0 0
    , expected: []
    }
  assertEqual
    { actual: range 1 1
    , expected: []
    }
  assertEqual
    { actual: range 0 1
    , expected: [ 0 ]
    }
  assertEqual
    { actual: range 0 2
    , expected: [ 0, 1 ]
    }
  assertEqual
    { actual: range 1 3
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: range 2 5
    , expected: [ 2, 3, 4 ]
    }

testFill :: Effect Unit
testFill = do
  assertEqual
    { actual: fill 1 2
    , expected: [ 1, 1 ]
    }
  assertEqual
    { actual: fill [ 1 ] 2
    , expected: [ [ 1 ], [ 1 ] ]
    }

testUnique :: Effect Unit
testUnique = do
  assertEqual
    { actual: unique [ 1, 2, 3 ]
    , expected: true
    }
  assertEqual
    { actual: unique [ 1, 2, 2 ]
    , expected: false
    }
