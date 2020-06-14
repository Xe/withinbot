let camp = ../../package.dhall

in  camp.Item::{
    , name = "Longsword"
    , description = "A standard one-handed longsword to maul bad guys with."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.ATK } ]
    , kind = camp.ItemKind.Weapon
    , cost = 30
    , sellValue = Some 7
    }
