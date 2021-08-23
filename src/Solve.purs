module Solve where

import Prelude
import Boggle (generateBoggle)
import Paths (Boundaries, Coordinates)
import Interfaces (MoveGenerator)
import Linear (generateLinear)
import Move (Move)
import Sequences (range)

width :: forall a. Array (Array a) -> Int
width matrix = 0

height :: forall a. Array (Array a) -> Int
height matrix = 0

inferBoundaries :: Int -> Int -> Coordinates -> Boundaries
inferBoundaries width height pos = { r: 0, l: 0, u: 0, d: 0 }

fillRectangle :: Array (Array Char) -> Array (Array Char)
fillRectangle martix = martix

solve :: MoveGenerator -> Array (Array Char) -> Int -> Array String
solve generator matrix n = do
  x <- range 0 w
  y <- range 0 h
  remapMoves (fillRectangle matrix) (validMoves { x, y })
  where
  w = width matrix

  h = height matrix

  validMoves pos = generator n (inferBoundaries w h pos)

remapMoves :: Array (Array Char) -> Array (Array Move) -> Array String
remapMoves matrix moves = []

solveBoggle :: Array (Array Char) -> Int -> Array String
solveBoggle = solve generateBoggle

solveLinear :: Array (Array Char) -> Int -> Array String
solveLinear = solve generateLinear
