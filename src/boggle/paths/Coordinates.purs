module Boggle.Paths.Coordinates where

import Prelude
import Boggle.Paths.Moves (Move(..))
import Boggle.Utils.Matrices (Matrix, elem, ncols, nrows)
import Boggle.Utils.NonEmpty (last)
import Data.Array (foldl, range)
import Data.Array.NonEmpty (singleton, toArray)
import Data.Maybe (fromMaybe)

infix 8 range as ..

type Coordinates
  = { x :: Int
    , y :: Int
    }

step :: Move -> Coordinates -> Coordinates
step R { x: x, y } = { x: x + 1, y }

step L { x: x, y } = { x: x - 1, y }

step U { x, y: y } = { x, y: y + 1 }

step D { x, y: y } = { x, y: y - 1 }

step UR { x: x, y: y } = { x: x + 1, y: y + 1 }

step UL { x: x, y: y } = { x: x - 1, y: y + 1 }

step DR { x: x, y: y } = { x: x + 1, y: y - 1 }

step DL { x: x, y: y } = { x: x - 1, y: y - 1 }

trace :: Array Move -> Array Coordinates
trace arr = toArray $ foldl traced (singleton { x: 0, y: 0 }) arr
  where
  traced acc x = acc <> singleton (step x $ last acc)

path :: forall a. Matrix a -> a -> Array Coordinates -> Array a
path mat missing arr = do
  c <- arr
  pure <<< (fromMaybe missing) $ elem c.x c.y mat

cartesian :: forall a. Matrix a -> Array Coordinates
cartesian mat = do
  y <- 0 .. (ncols mat - 1)
  x <- 0 .. (nrows mat - 1)
  pure { x, y }
