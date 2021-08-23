module Test.Boundaries where

import Prelude
import Move (Move(..))
import Boundaries (contains, findExtrema, verifyBoundaries)
import Effect (Effect)
import Test.Assert (assertEqual)

testBoundaries :: Effect Unit
testBoundaries = do
  testContains
  testFindExtrema
  testVerifyBoundaries

testContains :: Effect Unit
testContains = do
  assertEqual
    { actual:
        contains
          { r: 0, l: 0, u: 0, d: 0 }
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        contains
          { r: 1, l: 1, u: 1, d: 1 }
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        contains
          { r: 1, l: 1, u: 1, d: 1 }
          { r: 2, l: 1, u: 1, d: 1 }
    , expected: false
    }

testFindExtrema :: Effect Unit
testFindExtrema = do
  assertEqual
    { actual: findExtrema []
    , expected: { r: 0, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ R ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ R, U ]
    , expected: { r: 1, l: 0, u: 1, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ R, L ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ R, L, R, L ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ R, R, L, L ]
    , expected: { r: 2, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ UR, R ]
    , expected: { r: 2, l: 0, u: 1, d: 0 }
    }
  assertEqual
    { actual: findExtrema [ UR, R, D, DL ]
    , expected: { r: 2, l: 0, u: 1, d: 1 }
    }

testVerifyBoundaries :: Effect Unit
testVerifyBoundaries = do
  assertEqual
    { actual:
        verifyBoundaries
          []
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        verifyBoundaries
          [ R ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        verifyBoundaries
          [ R, L ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: true
    }
  assertEqual
    { actual:
        verifyBoundaries
          [ R, R ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: false
    }
  assertEqual
    { actual:
        verifyBoundaries
          [ R, R, L, L ]
          { r: 1, l: 1, u: 1, d: 1 }
    , expected: false
    }
