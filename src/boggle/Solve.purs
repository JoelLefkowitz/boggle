module Boggle.Solve where

import Prelude
import Boggle.Paths.Boundaries (infer)
import Boggle.Paths.Coordinates (cartesian, path, trace)
import Boggle.Paths.Moves (moveSingletons)
import Boggle.Rules (bounded, noRepeat)
import Boggle.Utils.Arrays (range)
import Boggle.Utils.Matrices (Matrix)
import Boggle.Utils.Sequences (nFiltered)
import Data.Array (filter)
import Data.Set (fromFoldable, toUnfoldable)
import Data.String.CodeUnits (fromCharArray)

infix 8 range as ..

foreign import isWord :: String -> Boolean

routes :: Matrix Char -> Int -> Array String
routes mat n = do
  pos <- cartesian mat
  pattern <- nFiltered (\x -> check pos x) moveSingletons (n - 1)
  pure $ fromCharArray $ path mat '_' ((\x -> x + pos) <$> (trace pattern))
  where
  check pos pattern = (noRepeat pattern) && (bounded pattern $ infer mat pos)

words :: Matrix Char -> Int -> Array String
words mat max =
  toUnfoldable $ fromFoldable
    $ filter isWord do
        n <- 0 .. (max + 1)
        routes mat n
