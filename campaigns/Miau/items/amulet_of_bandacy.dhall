let camp = ../../package.dhall

in  camp.Item::{
    , name = "Amulet of Bandacy"
    , description = "An amulet that increases a bandit's natural deterity."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.DEF } ]
    , cost = 30
    , sellValue = Some 4
    }
