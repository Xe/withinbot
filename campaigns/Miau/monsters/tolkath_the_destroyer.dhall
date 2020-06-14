let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Tol'kath the Destroyer"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 8 }
    , hp = camp.Range::{ low = 14, high = 18 }
    , armor = 3
    , exp = camp.Roll::{ diceCount = Some 20, diceSides = 6, plus = Some +30 }
    , items =
      [ camp.MonsterItem::{ item = ../items/amulet_of_bandacy.dhall }
      , camp.MonsterItem::{ item = ../items/tolkath_battleaxe.dhall }
      ]
    }
