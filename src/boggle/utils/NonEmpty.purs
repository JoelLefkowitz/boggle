module Boggle.Utils.NonEmpty where

import Prelude
import Data.Array.NonEmpty
  ( NonEmptyArray
  , appendArray
  , head
  , reverse
  , cons
  , singleton
  , sort
  , cons'
  )

last :: forall a. Ord a => NonEmptyArray a -> a
last = head <<< reverse

max :: forall a. Ord a => NonEmptyArray a -> a
max arr = last $ sort arr

min :: forall a. Ord a => NonEmptyArray a -> a
min arr = head $ sort arr

default :: forall a. Array a -> a -> NonEmptyArray a
default arr a = cons' a arr

tare :: Array Int -> NonEmptyArray Int
tare arr = appendArray (singleton 0) arr

prior :: NonEmptyArray Int -> NonEmptyArray Int
prior arr
  | head arr <= 0 = arr
  | otherwise = prior $ cons (head arr - 1) arr
