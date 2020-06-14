let camp = ../../package.dhall

in  camp.Item::{
    , name = "Greatsword"
    , description = "A standard two-handed greatsword to maul bad guys with."
    , weight = 2
    , bonuses = [ camp.Bonus::{ amount = Some +12, stat = Some camp.Stat.ATK } ]
    , kind = camp.ItemKind.Weapon
    , cost = 30
    , sellValue = Some 7
    }
