module Data.Matrix where

import Prelude hiding (max)
import Data.Sequences (max, pad)
import Data.Coordinates (Coordinates, next)
import Data.Array as Array
import Control.Alternative (guard)
import Data.Array (filter, foldl, length, snoc, singleton, (..))
import Data.Array.NonEmpty (cons')
import Data.String (joinWith)
import Data.Maybe (Maybe, fromMaybe, isJust)

newtype Matrix a
  = Matrix (Array (Array a))

derive newtype instance eqMatrix :: Eq a => Eq (Matrix a)

instance showMatrix :: Show a => Show (Matrix a) where
  show (Matrix rows) = joinWith "\n" $ (\row -> "│" <> (join row) <> "│") <$> rows
    where
    join row = joinWith ", " $ pad (width $ Matrix rows) "_" (show <$> row)

width :: ∀ a. Matrix a -> Int
width (Matrix rows) = max $ cons' 0 (length <$> rows)

height :: ∀ a. Matrix a -> Int
height (Matrix rows) = length rows

size :: ∀ a. Matrix a -> Int
size m = width m * height m

index :: ∀ a. Matrix a -> Coordinates -> Maybe a
index (Matrix rows) { x, y } = do
  row <- Array.index rows y
  Array.index row x

elem :: ∀ a. Matrix a -> a -> Coordinates -> a
elem m d x = fromMaybe d $ index m x

contains :: ∀ a. Matrix a -> Coordinates -> Boolean
contains m x = isJust $ index m x

points :: ∀ a. Matrix a -> Array Coordinates
points m = do
  x <- 0 .. height m
  y <- 0 .. width m
  guard $ contains m { x, y }
  pure { x, y }

steps :: ∀ a. Matrix a -> Array Coordinates -> Array (Array Coordinates)
steps m arr = snoc arr <$> (filter (\x -> contains m x && not Array.elem x arr) $ next arr)

paths :: ∀ a. Matrix a -> Int -> Array (Array Coordinates)
paths m n
  | n == 0 || n > size m = []
  | otherwise = foldl (\acc _ -> acc >>= steps m) (singleton <$> points m) $ if n == 1 then [] else 0 .. (n - 2)
