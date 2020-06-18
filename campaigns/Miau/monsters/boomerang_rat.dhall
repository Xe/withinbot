let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Boomerang Rat"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 4 }
    , hp = 6
    , armor = 0
    , exp = 25
    , items = [ camp.MonsterItem::{ item = ../items/boomerang.dhall } ]
    }
