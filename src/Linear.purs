module Linear where

import Prelude
import Interfaces (MoveGenerator)
import Move (Move, moveSingletons)
import Paths (verifyBoundaries)
import Sequences (filteredTuples)

verifyLinear :: Array Move -> Boolean
verifyLinear arr = noCross arr && noOverlap arr

noCross :: Array Move -> Boolean
noCross _ = true

noOverlap :: Array Move -> Boolean
noOverlap _ = true

generateLinear :: MoveGenerator
generateLinear n bounds = filteredTuples check moveSingletons n
  where
  check x = verifyBoundaries x bounds && verifyLinear x
