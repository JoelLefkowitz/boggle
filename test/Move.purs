module Test.Move where

import Prelude
import Effect (Effect)
import Move (Move(..), generateMoves)
import Test.Assert (assertEqual)

testMove :: Effect Unit
testMove = do
  testShowMove
  testGenerateMoves

testShowMove :: Effect Unit
testShowMove = do
  assertEqual
    { actual: show [ R, L, U, D ]
    , expected: "[→,←,↑,↓]"
    }

testGenerateMoves :: Effect Unit
testGenerateMoves = do
  assertEqual
    { actual: generateMoves 1
    , expected:
        [ [ R ]
        , [ L ]
        , [ U ]
        , [ D ]
        , [ UR ]
        , [ UL ]
        , [ DR ]
        , [ DL ]
        ]
    }
