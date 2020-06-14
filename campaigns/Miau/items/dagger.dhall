let camp = ../../package.dhall

in  camp.Item::{
    , name = "Iron Dagger"
    , description = "Can be used in your offhand for a second attack"
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , cost = 30
    , sellValue = Some 5
    }
