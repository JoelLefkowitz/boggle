module Test.Paths where

import Prelude
import Move (Move(..))
import Paths (contains, traceCoordinates, findExtrema, verifyBoundaries)
import Effect (Effect)
import Test.Assert (assertEqual)

testPaths :: Effect Unit
testPaths = do
  testContains
  testTraceCoordinates
  testFindExtrema
  testVerifyBoundaries

testContains :: Effect Unit
testContains = do
  assertEqual
    { actual:
        contains
          { r: 1, l: 1, u: 1, d: 1 }
          { r: 0, l: 0, u: 0, d: 0 }
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

testTraceCoordinates :: Effect Unit
testTraceCoordinates = do
  assertEqual
    { actual: traceCoordinates []
    , expected: [ { x: 0, y: 0 } ]
    }
  assertEqual
    { actual: traceCoordinates [ R ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 } ]
    }
  assertEqual
    { actual: traceCoordinates [ R, R ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 0 } ]
    }
  assertEqual
    { actual: traceCoordinates [ R, UR ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 1 } ]
    }
  assertEqual
    { actual: traceCoordinates [ R, UR, L ]
    , expected: [ { x: 0, y: 0 }, { x: 1, y: 0 }, { x: 2, y: 1 }, { x: 1, y: 1 } ]
    }

testFindExtrema :: Effect Unit
testFindExtrema = do
  assertEqual
    { actual:
        findExtrema
          []
    , expected: { r: 0, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          ]
    , expected: { r: 0, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 1, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          , { x: 0, y: 1 }
          , { x: 0, y: 2 }
          ]
    , expected: { r: 0, l: 0, u: 2, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 0 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 0 }
          , { x: 0, y: 0 }
          , { x: 1, y: 0 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 0 }
          , { x: 2, y: 0 }
          , { x: 1, y: 0 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 2, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        findExtrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 1 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 1, d: 0 }
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
