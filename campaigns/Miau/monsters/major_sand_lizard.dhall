let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Major Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 8 }
    , hp = camp.Range::{ low = 8, high = 14 }
    , armor = 2
    , exp = camp.Roll::{ diceCount = Some 30, diceSides = 6 }
    , items =
      [ camp.MonsterItem::{ item = ../items/dagger.dhall }
      , camp.MonsterItem::{ item = ../items/shortsword.dhall }
      ]
    }
