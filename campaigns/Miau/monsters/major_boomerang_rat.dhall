let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Major Boomerang Rat"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 6 }
    , hp = camp.Range::{ low = 8, high = 12 }
    , armor = 1
    , exp = camp.Roll::{ diceCount = Some 24, diceSides = 6 }
    , items =
      [ camp.MonsterItem::{
        , dice = Some camp.Roll::{
          , diceCount = Some 1
          , diceSides = 6
          , min = Some 6
          }
        , item = ../items/super_boomerang.dhall
        }
      , camp.MonsterItem::{ item = ../items/boomerang.dhall }
      ]
    }
