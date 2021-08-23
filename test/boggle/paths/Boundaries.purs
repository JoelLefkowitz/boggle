module Test.Boggle.Paths.Boundaries where

import Prelude

import Boggle.Paths.Boundaries (contains, extrema)
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testBoundaries :: Effect Unit
testBoundaries = do
  log "Running testBoundaries"
  testContains
  testExtrema

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

testExtrema :: Effect Unit
testExtrema = do
  assertEqual
    { actual: extrema []
    , expected: { r: 0, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: extrema [ { x: 0, y: 0 } ]
    , expected: { r: 0, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual: extrema [ { x: 1, y: 0 } ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        extrema
          [ { x: 0, y: 0 }
          , { x: 0, y: 1 }
          , { x: 0, y: 2 }
          ]
    , expected: { r: 0, l: 0, u: 2, d: 0 }
    }
  assertEqual
    { actual:
        extrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 0 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 0, d: 0 }
    }
  assertEqual
    { actual:
        extrema
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
        extrema
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
        extrema
          [ { x: 0, y: 0 }
          , { x: 1, y: 1 }
          , { x: 0, y: 0 }
          ]
    , expected: { r: 1, l: 0, u: 1, d: 0 }
    }
