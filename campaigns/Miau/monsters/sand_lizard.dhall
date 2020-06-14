let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 4 }
    , hp = camp.Range::{ low = 4, high = 6 }
    , armor = 0
    , exp = camp.Roll::{ diceCount = Some 20, diceSides = 6 }
    }
