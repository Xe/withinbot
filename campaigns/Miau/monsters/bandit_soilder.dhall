let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Bandit Soilder"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 8 }
    , hp = 16
    , armor = 1
    , exp = 200
    , items =
      [ camp.MonsterItem::{
        , dice = Some camp.Roll::{
          , diceCount = Some 1
          , diceSides = 6
          , min = Some 6
          }
        , item = ../items/amulet_of_bandacy.dhall
        }
      , camp.MonsterItem::{ item = ../items/longsword.dhall }
      , camp.MonsterItem::{ item = ../items/greatsword.dhall }
      , camp.MonsterItem::{ item = ../items/battleaxe.dhall }
      ]
    }
