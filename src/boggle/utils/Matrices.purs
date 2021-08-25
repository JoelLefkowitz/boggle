module Boggle.Utils.Matrices where

import Prelude
import Boggle.Utils.Arrays (fill, range)
import Data.Array (concat, index, length, slice)
import Data.Maybe (Maybe(..), fromMaybe)

infix 8 range as ..

data Matrix a
  = Dense Int Int (Array a)

instance eqMatrix :: Eq a => Eq (Matrix a) where
  eq (Dense r1 c1 d1) (Dense r2 c2 d2) = r1 == r2 && c1 == c2 && d1 == d2

instance showMatrix :: Show a => Show (Matrix a) where
  show (Dense r c ds) =
    "Dense Matrix nrows=" <> show r
      <> ", ncols="
      <> show c
      <> ", data="
      <> show ds

nrows :: forall a. Matrix a -> Int 
nrows (Dense r _ _) = r

ncols :: forall a. Matrix a -> Int 
ncols (Dense _ c _) = c

pad :: forall a. Int -> Array a -> a -> Array a
pad n arr p
  | length arr >= n = arr
  | otherwise = concat [ arr, fill p (n - length arr) ]

fit :: forall a. Int -> Array a -> a -> Array a
fit n arr p = slice 0 n (pad n arr p)

toChain :: forall a. Int -> Int -> Array (Array a) -> a -> Array (Array a)
toChain h w mat default = do
  y <- 0 .. h
  pure $ fit w (fromMaybe [] (index mat y)) default

fromArray :: forall a. Int -> Int -> Array (Array a) -> a -> Matrix a
fromArray h w mat default = Dense h w (concat $ toChain h w mat default)

elem :: forall a. Int -> Int -> Matrix a -> Maybe a
elem x y (Dense w h mat)
  | x <= w && y <= h = index mat (y * w + x)
  | otherwise = Nothing
