module Boggle.Utils.Arrays where

import Prelude
import Boggle.Utils.NonEmpty (prior)
import Data.Array (length)
import Data.Array.NonEmpty (toArray, singleton)
import Data.Set (fromFoldable, size)

infix 8 range as ..

shift :: forall f. Functor f => Int -> f Int -> f Int
shift n arr = (\x -> x + n) <$> arr

range :: Int -> Int -> Array Int
range lo hi
  | lo >= hi = []
  | otherwise =
    shift lo
      <<< toArray
      <<< prior
      <<< singleton
      $ length
    where
    length = hi - (lo + 1)

fill :: forall a. a -> Int -> Array a
fill x n = (\_ -> x) <$> (0 .. n)

unique :: forall a. Ord a => Array a -> Boolean
unique arr = size (fromFoldable arr) == length arr
