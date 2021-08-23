module Move where

import Prelude
import Sequences (nTuples)

data Move
  = R
  | L
  | U
  | D
  | UR
  | UL
  | DR
  | DL

moveSingletons :: Array (Array Move)
moveSingletons =
  [ [ R ]
  , [ L ]
  , [ U ]
  , [ D ]
  , [ UR ]
  , [ UL ]
  , [ DR ]
  , [ DL ]
  ]

instance showMove :: Show Move where
  show R = "→"
  show L = "←"
  show U = "↑"
  show D = "↓"
  show UR = "↗"
  show UL = "↖"
  show DR = "↘"
  show DL = "↙"

instance eqMove :: Eq Move where
  eq R R = true
  eq L L = true
  eq U U = true
  eq D D = true
  eq UR UR = true
  eq UL UL = true
  eq DR DR = true
  eq DL DL = true
  eq _ _ = false

generateMoves :: Int -> Array (Array Move)
generateMoves = nTuples moveSingletons
