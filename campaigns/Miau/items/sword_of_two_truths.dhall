let camp = ../../package.dhall

in  camp.Item::{
    , name = "Sword of Two Truths"
    , description =
        "The legendary Sword of Two Truths, bane of all those who practice deception."
    , bonuses = [ camp.Bonus::{ amount = Some +2, stat = Some camp.Stat.ATK } ]
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , cost = 60
    , sellValue = Some 45
    , legendary = True
    }
