module Test.Boggle.Solve where

import Data.Set (fromFoldable)
import Prelude
import Boggle.Solve (words, routes)
import Boggle.Utils.Matrices (Matrix(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testSolve :: Effect Unit
testSolve = do
  log "Running testSolve"
  testRoutes

testRoutes :: Effect Unit
testRoutes = do
  assertEqual
    { actual: routes (Dense 2 2 [ 'a', 'b', 'c', 'd' ]) 2
    , expected:
        [ "ab"
        , "ac"
        , "ad"
        , "ba"
        , "bd"
        , "bc"
        , "cd"
        , "ca"
        , "cb"
        , "dc"
        , "db"
        , "da"
        ]
    }

