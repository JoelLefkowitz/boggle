module Data.Coordinates where

import Prelude
import Data.Array (head, range)
import Data.Maybe (fromMaybe)

infix 8 range as ..

type Coordinates
  = { x :: Int
    , y :: Int
    }

adjacent :: Coordinates -> Array Coordinates
adjacent { x, y } =
  [ { x: x - 1, y: y - 1 }
  , { x, y: y - 1 }
  , { x: x + 1, y: y - 1 }
  , { x: x - 1, y }
  , { x: x + 1, y }
  , { x: x - 1, y: y + 1 }
  , { x, y: y + 1 }
  , { x: x + 1, y: y + 1 }
  ]

next :: Array Coordinates -> Array Coordinates
next arr = fromMaybe [] $ adjacent <$> head arr
