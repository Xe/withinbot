let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Great Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 6 }
    , hp = 10
    , armor = 1
    , exp = 75
    , items =
      [ camp.MonsterItem::{ item = ../items/dagger.dhall }
      , camp.MonsterItem::{ item = ../items/shortsword.dhall }
      ]
    }
