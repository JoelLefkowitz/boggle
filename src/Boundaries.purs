module Boundaries where

import Prelude
import Data.Foldable (and)
import Move (Move)

type Boundaries
  = { r :: Int
    , l :: Int
    , u :: Int
    , d :: Int
    }

contains :: Boundaries -> Boundaries -> Boolean
contains x y =
  and
    [ x.r >= y.r
    , x.l >= y.l
    , x.u >= y.u
    , x.d >= y.d
    ]

findExtrema :: Array Move -> Boundaries
findExtrema _ =
  { r: 0
  , l: 0
  , u: 0
  , d: 0
  }

verifyBoundaries :: Array Move -> Boundaries -> Boolean
verifyBoundaries arr bounds = contains bounds (findExtrema arr)
