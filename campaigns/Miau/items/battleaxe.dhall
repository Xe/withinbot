let camp = ../../package.dhall

in  camp.Item::{
    , name = "Battleaxe"
    , description = "A two-handed battleaxe for mauling enemies."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.ATK } ]
    , kind = camp.ItemKind.Weapon
    , cost = 30
    , weight = 2
    , sellValue = Some 7
    }
