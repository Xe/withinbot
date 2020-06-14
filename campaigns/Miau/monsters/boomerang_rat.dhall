let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Boomerang Rat"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 4 }
    , hp = camp.Range::{ low = 4, high = 8 }
    , armor = 0
    , exp = camp.Roll::{ diceCount = Some 12, diceSides = 6 }
    , items = [ camp.MonsterItem::{ item = ../items/boomerang.dhall } ]
    }
