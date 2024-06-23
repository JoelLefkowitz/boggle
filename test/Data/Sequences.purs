module Test.Data.Sequences where

import Prelude hiding (max)
import Data.Sequences (pad, max, fill, last)
import Data.Array.NonEmpty (cons')
import Effect (Effect)
import Test.Assert (assertEqual)

testSequences :: Effect Unit
testSequences = do
  assertEqual
    { actual: fill 1 3
    , expected: [ 1, 1, 1 ]
    }
  assertEqual
    { actual: pad 5 0 [ 1, 2, 3 ]
    , expected: [ 1, 2, 3, 0, 0 ]
    }
  assertEqual
    { actual: last $ cons' 1 [ 2, 3 ]
    , expected: 3
    }
  assertEqual
    { actual: max $ cons' 1 [ 3, 2 ]
    , expected: 3
    }
