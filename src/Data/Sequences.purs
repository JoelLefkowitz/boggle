module Data.Sequences where

import Prelude hiding (max)
import Data.Array.NonEmpty (NonEmptyArray, head, reverse, sort)
import Data.Array (concat, length, (..))

fill :: ∀ a. a -> Int -> Array a
fill x n = (\_ -> x) <$> (0 .. (n - 1))

pad :: ∀ a. Int -> a -> Array a -> Array a
pad n p arr
  | length arr >= n = arr
  | otherwise = concat [ arr, fill p (n - length arr) ]

last :: ∀ a. Ord a => NonEmptyArray a -> a
last = head <<< reverse

max :: ∀ a. Ord a => NonEmptyArray a -> a
max arr = last $ sort arr
