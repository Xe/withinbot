let camp = ../../package.dhall

in  camp.Item::{
    , name = "Tol'kath's Battleaxe of Destruction"
    , description = "A two-handed battleaxe for mauling enemies."
    , bonuses = [ camp.Bonus::{ amount = Some +4, stat = Some camp.Stat.ATK } ]
    , kind = camp.ItemKind.Weapon
    , cost = 150
    , weight = 3
    , sellValue = Some 150
    , legendary = True
    }
