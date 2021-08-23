module Sequences where

import Prelude
import Data.Set (fromFoldable, size)
import Data.Array (foldl, filter, length)
import Data.Array.NonEmpty (NonEmptyArray, cons, fromArray, head, reverse, singleton, sort, toArray)
import Data.Maybe (fromMaybe)

last :: forall a. Ord a => NonEmptyArray a -> a
last = head <<< reverse

arrayMax :: forall a. Ord a => NonEmptyArray a -> a
arrayMax arr = last $ sort arr

arrayMin :: forall a. Ord a => NonEmptyArray a -> a
arrayMin arr = head $ sort arr

default :: forall a. Array a -> a -> NonEmptyArray a
default arr a = fromMaybe (singleton a) (fromArray $ arr)

unique :: forall a. Ord a => Array a -> Boolean
unique arr = (size $ fromFoldable arr) == (length arr)

range :: Int -> Int -> Array Int
range lo hi
  | lo >= hi = []
  | otherwise = shift <<< toArray <<< decrementBefore <<< singleton $ (hi - lo) - 1
    where
    shift arr = addMap arr lo

decrementBefore :: NonEmptyArray Int -> NonEmptyArray Int
decrementBefore arr
  | head arr <= 0 = arr
  | otherwise = decrementBefore $ cons (head arr - 1) arr

addMap :: Array Int -> Int -> Array Int
addMap arr n = (\x -> x + n) <$> arr

fill :: forall a. a -> Int -> Array a
fill x n = (\_ -> x) <$> (range 0 n)

product :: forall a. Semigroup a => Array a -> Array a -> Array a
product arr1 arr2 = do
  x <- arr1
  y <- arr2
  pure $ x <> y

nTuples :: forall a. Semigroup a => Array a -> Int -> Array a
nTuples arr n
  | n <= 0 = []
  | otherwise = foldl product arr $ fill arr (n - 1)

filteredTuples :: forall a. Semigroup a => (a -> Boolean) -> Array a -> Int -> Array a
filteredTuples check arr n
  | n <= 0 = []
  | n == 1 = filter check arr
  | otherwise = foldl step arr $ fill arr (n - 1)
    where
    step acc x = filter check $ product acc x
