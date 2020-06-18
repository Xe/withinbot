let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Major Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 8 }
    , hp = 14
    , armor = 2
    , exp = 150
    , items =
      [ camp.MonsterItem::{ item = ../items/dagger.dhall }
      , camp.MonsterItem::{ item = ../items/shortsword.dhall }
      ]
    }
