module Boggle where

import Prelude
import Boundaries (Boundaries, verifyBoundaries)
import Move (Move, moveSingletons)
import Sequences (filteredTuples)

verifyBoggle :: Array Move -> Boolean
verifyBoggle _ = true

generateBoggle :: Int -> Boundaries -> Array (Array Move)
generateBoggle n bounds = filteredTuples check moveSingletons n
  where
  check x = verifyBoundaries x bounds && verifyBoggle x
