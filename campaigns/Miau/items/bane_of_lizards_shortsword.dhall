let camp = ../../package.dhall

in  camp.Item::{
    , name = "Bane of Lizards Shortsword"
    , description =
        "A one-handed sword to hurt bad guys with, with a special talent for hurting lizards."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.ATK } ]
    , kind = camp.ItemKind.Weapon
    , cost = 70
    , sellValue = Some 50
    , legendary = True
    }
