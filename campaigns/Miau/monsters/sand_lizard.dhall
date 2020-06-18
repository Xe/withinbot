let camp = ../../package.dhall

in  camp.Monster::{
    , name = "Sand Lizard"
    , damage = camp.Roll::{ diceCount = Some 1, diceSides = 4 }
    , hp = 5
    , armor = 0
    , exp = 25
    }
