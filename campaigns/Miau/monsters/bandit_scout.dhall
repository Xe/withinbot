let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Bandit Scout"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 6 }
    , hp = camp.Range::{ low = 10, high = 14 }
    , armor = 1
    , exp = camp.Roll::{ diceCount = Some 15, diceSides = 6, plus = Some +15 }
    , items =
      [ camp.MonsterItem::{
        , dice = Some camp.Roll::{
          , diceCount = Some 1
          , diceSides = 6
          , min = Some 6
          }
        , item = ../items/amulet_of_bandacy.dhall
        }
      ]
    }
