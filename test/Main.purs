module Test.Main where

import Prelude
import Effect (Effect)
import Test.Data.Coordinates (testCoordinates)
import Test.Data.Matrix (testMatrix)
import Test.Data.Sequences (testSequences)
import Test.Data.Word (testWord)

main :: Effect Unit
main = do
  testCoordinates
  testMatrix
  testSequences
  testWord
