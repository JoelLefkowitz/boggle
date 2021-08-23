module Boggle.Paths.Coordinates where

import Prelude
import Boggle.Paths.Moves (Move(..))
import Boggle.Utils.NonEmpty (last)
import Data.Array (foldl)
import Data.Array.NonEmpty (singleton, toArray)

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
