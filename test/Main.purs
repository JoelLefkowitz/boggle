module Test.Main where

import Prelude
import Effect (Effect)
import Test.Boggle (testBoggle)
import Test.Paths (testPaths)
import Test.Linear (testLinear)
import Test.Sequences (testSequences)
import Test.Move (testMove)

main :: Effect Unit
main = do
  testBoggle
  testPaths
  testLinear
  testMove
  testSequences
