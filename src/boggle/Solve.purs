module Boggle.Solve where

import Boggle.Utils.Arrays (range)

infix 8 range as ..

-- width :: forall a. Array (Array a) -> Int
-- width matrix = 0

-- height :: forall a. Array (Array a) -> Int
-- height matrix = 0

-- inferBoundaries :: Int -> Int -> Coordinates -> Boundaries
-- inferBoundaries width height pos = { r: 0, l: 0, u: 0, d: 0 }

-- fillRectangle :: Array (Array Char) -> Array (Array Char)
-- fillRectangle martix = martix

-- solve :: MoveGenerator -> Array (Array Char) -> Int -> Array String
-- solve generator matrix n = do
--   x <- range 0 w
--   y <- range 0 h
--   remapMoves (fillRectangle matrix) (validMoves { x, y })
--   where
--   w = width matrix
--   h = height matrix
--   validMoves pos = generator n (inferBoundaries w h pos)

-- solve :: Array (Array Char) -> Int -> Array String
-- solve matrix n = do
--   coordinate <- cartesian matrix
--   fromCharArray $ mapMoves matrix $ genereate n boundaries matrix coordinate

-- remapMoves :: Array (Array Char) -> Array (Array Move) -> Array String
-- remapMoves matrix moves = []

-- generate :: Int -> Boundaries -> Array Move
-- generate n bounds = filteredTuples (validPath bounds) moveSingletons n
