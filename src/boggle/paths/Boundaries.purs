module Boggle.Paths.Boundaries where

import Prelude hiding (min, max)
import Boggle.Paths.Coordinates (Coordinates)
import Boggle.Utils.Matrices (Matrix, ncols)
import Boggle.Utils.NonEmpty (max, min, tare)
import Data.Foldable (and)
import Data.Ord (abs)

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

extrema :: Array Coordinates -> Boundaries
extrema arr =
  { r: max x
  , l: abs $ min x
  , u: max y
  , d: abs $ min y
  }
  where
  x = tare ((\i -> i.x) <$> arr)

  y = tare ((\i -> i.y) <$> arr)

infer :: forall a. Matrix a -> Coordinates -> Boundaries
infer mat pos =
  { r: ncols mat - 1 - pos.x
  , l: pos.x
  , u: ncols mat - 1 - pos.y
  , d: pos.y
  }
