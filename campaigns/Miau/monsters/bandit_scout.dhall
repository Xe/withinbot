let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Bandit Scout"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 6 }
    , hp = 10
    , armor = 1
    , exp = 150
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
