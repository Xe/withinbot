let camp = ../../package.dhall

in  camp.Item::{
    , name = "Whisperwind"
    , description =
        "Harness the whispers of the wind wherever you are with this legendary bow."
    , bonuses = [ camp.Bonus::{ amount = Some +4, stat = Some camp.Stat.ATK } ]
    , weight = 2
    , kind = camp.ItemKind.Weapon
    , cost = 150
    , sellValue = Some 90
    , legendary = True
    }
