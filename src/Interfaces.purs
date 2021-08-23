module Interfaces where

import Move (Move)
import Paths (Boundaries)

type MoveGenerator
  = Int → Boundaries → Array (Array Move)
