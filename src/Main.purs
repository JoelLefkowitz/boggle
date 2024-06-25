module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Word (boggle)
import Data.Matrix (Matrix(..))
import Data.String (joinWith)

main :: Effect Unit
main = log $ joinWith ", " $ (\{ word } -> word) <$> boggle (Matrix [ [ "a", "b" ], [ "c", "d" ] ]) 4
