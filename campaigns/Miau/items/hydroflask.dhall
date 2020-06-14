let camp = ../../package.dhall

in  camp.Item::{
    , name = "Hydroflask"
    , description = "A flask of water."
    , kind = camp.ItemKind.Consumable
    , charges = Some 5
    , bonuses = [ camp.Bonus::{ amount = Some +2, stat = Some camp.Stat.HP } ]
    , cost = 30
    , sellValue = Some 10
    }
