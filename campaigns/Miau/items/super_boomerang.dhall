let camp = ../../package.dhall

in  camp.Item::{
    , name = "Super Boomerang"
    , description = "A boomerang stolen from a Major Boomerang Rat."
    , kind = camp.ItemKind.Weapon
    , bonuses = [ camp.Bonus::{ amount = Some +2, stat = Some camp.Stat.ATK } ]
    , cost = 40
    , sellValue = Some 20
    }
