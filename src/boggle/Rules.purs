module Boggle.Rules where

import Prelude

import Boggle.Paths.Boundaries (Boundaries, contains, extrema)
import Boggle.Paths.Coordinates (trace)
import Boggle.Paths.Moves (Move)
import Boggle.Utils.Arrays (unique)

noRepeat :: Array Move -> Boolean
noRepeat arr = unique $ trace arr

-- noCross :: Array Move -> Boolean
-- noCross _ = true

-- noOverlap :: Array Move -> Boolean
-- noOverlap _ = true

bounded :: Array Move -> Boundaries -> Boolean
bounded arr bounds = contains bounds (extrema $ trace arr)
