let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Great Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 6 }
    , hp = camp.Range::{ low = 6, high = 10 }
    , armor = 1
    , exp = camp.Roll::{ diceCount = Some 25, diceSides = 6 }
    , items =
      [ camp.MonsterItem::{ item = ../items/dagger.dhall }
      , camp.MonsterItem::{ item = ../items/shortsword.dhall }
      ]
    }
