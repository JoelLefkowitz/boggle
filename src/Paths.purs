module Paths where

import Prelude
import Data.Array (foldl)
import Data.Array.NonEmpty (appendArray, singleton, toArray)
import Data.Foldable (and)
import Move (Move(..))
import Sequences (last, arrayMax, arrayMin)

type Boundaries
  = { r :: Int
    , l :: Int
    , u :: Int
    , d :: Int
    }

type Coordinates
  = { x :: Int
    , y :: Int
    }

contains :: Boundaries -> Boundaries -> Boolean
contains x y =
  and
    [ x.r >= y.r
    , x.l >= y.l
    , x.u >= y.u
    , x.d >= y.d
    ]

moveCoordinate :: Move -> Coordinates -> Coordinates
moveCoordinate R { x: _x, y: _y } = { x: _x + 1, y: _y }

moveCoordinate L { x: _x, y: _y } = { x: _x - 1, y: _y }

moveCoordinate U { x: _x, y: _y } = { x: _x, y: _y + 1 }

moveCoordinate D { x: _x, y: _y } = { x: _x, y: _y - 1 }

moveCoordinate UR { x: _x, y: _y } = { x: _x + 1, y: _y + 1 }

moveCoordinate UL { x: _x, y: _y } = { x: _x - 1, y: _y + 1 }

moveCoordinate DR { x: _x, y: _y } = { x: _x + 1, y: _y - 1 }

moveCoordinate DL { x: _x, y: _y } = { x: _x - 1, y: _y - 1 }

traceCoordinates :: Array Move -> Array Coordinates
traceCoordinates arr = toArray $ foldl step (singleton { x: 0, y: 0 }) arr
  where
  step acc x = acc <> singleton (moveCoordinate x (last acc))

findExtrema :: Array Coordinates -> Boundaries
findExtrema arr = { r: arrayMax x, l: -arrayMin x, u: arrayMax y, d: -arrayMin y }
  where
  x = appendArray (singleton 0) ((\i -> i.x) <$> arr)

  y = appendArray (singleton 0) ((\i -> i.y) <$> arr)

verifyBoundaries :: Array Move -> Boundaries -> Boolean
verifyBoundaries arr bounds = contains bounds extrema
  where
  extrema = findExtrema $ traceCoordinates arr
