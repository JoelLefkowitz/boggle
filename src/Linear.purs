module Linear where

import Prelude
import Boundaries (Boundaries, verifyBoundaries)
import Move (Move, moveSingletons)
import Sequences (filteredTuples)

verifyLinear :: Array Move -> Boolean
verifyLinear _ = true

generateLinear :: Int -> Boundaries -> Array (Array Move)
generateLinear n bounds = filteredTuples check moveSingletons n
  where
  check x = verifyBoundaries x bounds && verifyLinear x
