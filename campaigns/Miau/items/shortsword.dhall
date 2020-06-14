let camp = ../../package.dhall

in  camp.Item::{
    , name = "Shortsword"
    , description = "A standard one-handed sword to hurt bad guys with."
    , kind = camp.ItemKind.Weapon
    , cost = 30
    , sellValue = Some 7
    }
