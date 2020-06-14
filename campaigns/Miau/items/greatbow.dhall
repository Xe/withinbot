let camp = ../../package.dhall

in  camp.Item::{
    , name = "Greatbow"
    , description =
        "A normal Greatbow to shoot baddies with. Has unlimited arrows."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.ATK } ]
    , weight = 2
    , kind = camp.ItemKind.Weapon
    , cost = 70
    , sellValue = Some 40
    }
