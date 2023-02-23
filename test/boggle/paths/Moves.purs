module Test.Boggle.Paths.Moves where

import Prelude
import Boggle.Paths.Moves (Move(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testMoves :: Effect Unit
testMoves = do
  log "Running testMoves"
  testShowMove

testShowMove :: Effect Unit
testShowMove = do
  assertEqual
    { actual: show [ R, L, U, D ]
    , expected: "[→,←,↑,↓]"
    }
