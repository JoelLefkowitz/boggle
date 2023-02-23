module Test.Boggle.Utils.Sequences where

import Prelude
import Boggle.Utils.Sequences (nFiltered, nTuples, product)
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testSequences :: Effect Unit
testSequences = do
  log "Running testSequences"
  testProduct
  testNTuples
  testNFiltered

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

testNFiltered :: Effect Unit
testNFiltered = do
  assertEqual
    { actual: nFiltered (\x -> x /= "a") [ "a", "b" ] 1
    , expected: [ "b" ]
    }
  assertEqual
    { actual: nFiltered (\x -> x /= [ 1, 1 ]) [ [ 1 ], [ 2 ] ] 2
    , expected: [ [ 1, 2 ], [ 2, 1 ], [ 2, 2 ] ]
    }
