module Test.Boggle.Solve where

import Data.Set (fromFoldable)
import Prelude
import Boggle.Solve (words, routes)
import Boggle.Utils.Matrices (Matrix(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

testSolve :: Effect Unit
testSolve = do
  log "Running testSolve"
  testRoutes
  testWords

testRoutes :: Effect Unit
testRoutes = do
  assertEqual
    { actual: routes (Dense 2 2 [ 'a', 'b', 'c', 'd' ]) 2
    , expected:
        [ "ab"
        , "ac"
        , "ad"
        , "ba"
        , "bd"
        , "bc"
        , "cd"
        , "ca"
        , "cb"
        , "dc"
        , "db"
        , "da"
        ]
    }

testWords :: Effect Unit
testWords = do
  assertEqual
    { actual:
        words
          ( Dense 4 4
              [ 'd'
              , 'a'
              , 'r'
              , 'm'
              , 'e'
              , 'n'
              , 'o'
              , 'k'
              , 'u'
              , 'v'
              , 'r'
              , 'a'
              , 't'
              , 'a'
              , 'c'
              , 'e'
              ]
          )
          7
    , expected:
        fromFoldable
          [ "ac"
          , "ace"
          , "acer"
          , "acre"
          , "ad"
          , "an"
          , "and"
          , "arc"
          , "are"
          , "area"
          , "ark"
          , "arm"
          , "at"
          , "av"
          , "ave"
          , "ca"
          , "car"
          , "care"
          , "cat"
          , "cave"
          , "dark"
          , "darn"
          , "dean"
          , "dear"
          , "den"
          , "ea"
          , "ear"
          , "earn"
          , "ed"
          , "en"
          , "end"
          , "era"
          , "km"
          , "mo"
          , "moan"
          , "more"
          , "morn"
          , "move"
          , "nae"
          , "near"
          , "neut"
          , "no"
          , "nor"
          , "norm"
          , "nova"
          , "nu"
          , "nut"
          , "oak"
          , "oar"
          , "okra"
          , "om"
          , "on"
          , "one"
          , "or"
          , "ore"
          , "ova"
          , "oven"
          , "race"
          , "rad"
          , "ran"
          , "rand"
          , "rat"
          , "rave"
          , "re"
          , "rec"
          , "rm"
          , "road"
          , "roan"
          , "roar"
          , "rove"
          , "tar"
          , "tare"
          , "tarn"
          , "taro"
          , "tau"
          , "tun"
          , "tuna"
          , "tune"
          , "var"
          , "vat"
          , "vend"
          ]
    }
  assertEqual
    { actual:
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
          6
    , expected:
        fromFoldable []
    }
