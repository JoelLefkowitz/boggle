module Boggle.Utils.Sequences where

import Prelude
import Boggle.Utils.Arrays (fill)
import Data.Array (foldl, filter)

product ::
  forall m a.
  Monad m =>
  Semigroup a =>
  m a -> m a -> m a
product a b = do
  x <- a
  y <- b
  pure $ x <> y

nTuples ::
  forall a.
  Semigroup a =>
  Array a -> Int -> Array a
nTuples arr n
  | n <= 0 = []
  | otherwise = foldl product arr $ fill arr (n - 1)

nFiltered ::
  forall a.
  Semigroup a =>
  (a -> Boolean) -> Array a -> Int -> Array a
nFiltered check arr n
  | n <= 0 = []
  | n == 1 = filter check arr
  | otherwise = foldl checked arr $ fill arr (n - 1)
    where
    checked acc x = filter check $ product acc x
