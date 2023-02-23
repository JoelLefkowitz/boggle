module Main where

import Prelude
import Boggle.Solve (words)
import Boggle.Utils.Matrices (Matrix(..))
import Data.Array (foldl)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = log $ foldl (\acc x -> acc <> ", " <> x) "" results
  where
  results =
    words
      ( Dense 4 5
          [ 'v'
          , 'm'
          , 'a'
          , 'z'
          , 'e'
          , 'i'
          , 'i'
          , 'c'
          , 'h'
          , 'r'
          , 'n'
          , 'd'
          , 'e'
          , 't'
          , 'o'
          , 'e'
          , 'c'
          , 'r'
          , 'a'
          , 'f'
          ]
      )
      7
