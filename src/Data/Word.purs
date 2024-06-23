module Data.Word where

import Prelude
import Data.Coordinates (Coordinates)
import Data.Matrix (Matrix, paths, elem)
import Data.Array ((..))
import Data.Foldable (fold)
import Control.Alternative (guard)

foreign import isWord :: String -> Boolean

type Word
  = { path :: Array Coordinates
    , word :: String
    }

boggle :: Matrix String -> Int -> Array Word
boggle m n = do
  x <- 3 .. n
  path <- paths m x
  let
    word = fold $ elem m "" <$> path
  guard $ isWord word
  pure { path, word }
