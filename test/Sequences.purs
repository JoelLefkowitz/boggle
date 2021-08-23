module Test.Sequences where

import Prelude
import Effect (Effect)
import Sequences (addMap, fill, filteredTuples, nTuples, product, range)
import Test.Assert (assertEqual)

testSequences :: Effect Unit
testSequences = do
  testAddMap
  testRange
  testFill
  testProduct
  testNTuples
  testFilteredTuples

testAddMap :: Effect Unit
testAddMap = do
  assertEqual
    { actual: addMap [ 1, 2, 3 ] 1
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

testProduct :: Effect Unit
testProduct = do
  assertEqual
    { actual: product [ [ 1 ] ] [ [] ]
    , expected: [ [ 1 ] ]
    }
  assertEqual
    { actual: product [ [ 1 ] ] [ [ 2 ] ]
    , expected: [ [ 1, 2 ] ]
    }
  assertEqual
    { actual: product [ [ 1, 2 ] ] [ [ 3 ] ]
    , expected: [ [ 1, 2, 3 ] ]
    }
  assertEqual
    { actual: product [ [ 1, 2 ], [ 3, 4 ] ] [ [ 5 ] ]
    , expected: [ [ 1, 2, 5 ], [ 3, 4, 5 ] ]
    }

testNTuples :: Effect Unit
testNTuples = do
  assertEqual
    { actual: nTuples [ "a", "b" ] 0
    , expected: []
    }
  assertEqual
    { actual: nTuples [ "a", "b" ] 1
    , expected: [ "a", "b" ]
    }
  assertEqual
    { actual: nTuples [ "a", "b" ] 2
    , expected: [ "aa", "ab", "ba", "bb" ]
    }
  assertEqual
    { actual: nTuples [ [ 1 ], [ 2 ] ] 2
    , expected: [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ] ]
    }

testFilteredTuples :: Effect Unit
testFilteredTuples = do
  assertEqual
    { actual: filteredTuples (\x -> x /= "a") [ "a", "b" ] 1
    , expected: [ "b" ]
    }
  assertEqual
    { actual: filteredTuples (\x -> x /= [ 1, 1 ]) [ [ 1 ], [ 2 ] ] 2
    , expected: [ [ 1, 2 ], [ 2, 1 ], [ 2, 2 ] ]
    }
