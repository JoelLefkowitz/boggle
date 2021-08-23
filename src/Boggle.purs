module Boggle where

import Prelude
import Interfaces (MoveGenerator)
import Move (Move, moveSingletons)
import Paths (traceCoordinates, verifyBoundaries)
import Sequences (filteredTuples, unique)

verifyBoggle :: Array Move -> Boolean
verifyBoggle arr = unique $ traceCoordinates arr

generateBoggle :: MoveGenerator
generateBoggle n bounds = filteredTuples check moveSingletons n
  where
  check x = verifyBoundaries x bounds && verifyBoggle x
