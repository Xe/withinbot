let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Tol'kath the Destroyer"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 8 }
    , hp = 22
    , armor = 3
    , exp = 400
    , items =
      [ camp.MonsterItem::{ item = ../items/amulet_of_bandacy.dhall }
      , camp.MonsterItem::{ item = ../items/tolkath_battleaxe.dhall }
      ]
    , drops =
      [ ../items/sandstorm_amulet.dhall, ../items/amulet_of_bandacy.dhall ]
    }
