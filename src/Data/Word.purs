module Data.Word where

import Prelude
import Data.Coordinates (Coordinates)
import Data.Matrix (Matrix, paths, index)
import Data.Array ((..))
import Data.String (joinWith)
import Data.Maybe (fromMaybe)
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
  guard <<< isWord $ join path
  pure { path, word: join path }
  where
  join path = joinWith "" $ (\x -> fromMaybe "" $ index m x) <$> path
