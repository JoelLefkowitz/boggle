module Test.Main where

import Prelude
import Effect (Effect)
import Test.Boggle.Paths.Boundaries (testBoundaries)
import Test.Boggle.Paths.Coordinates (testCoordinates)
import Test.Boggle.Paths.Moves (testMoves)
import Test.Boggle.Rules (testRules)
import Test.Boggle.Solve (testSolve)
import Test.Boggle.Utils.Arrays (testArrays)
import Test.Boggle.Utils.Matrices (testMatrices)
import Test.Boggle.Utils.NonEmpty (testNonEmpty)
import Test.Boggle.Utils.Sequences (testSequences)

main :: Effect Unit
main = do
  testArrays
  testBoundaries
  testCoordinates
  testMatrices
  testMoves
  testNonEmpty
  testRules
  testSequences
  testSolve
