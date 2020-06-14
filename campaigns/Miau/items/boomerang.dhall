let camp = ../../package.dhall

in  camp.Item::{
    , name = "Boomerang"
    , description = "A boomerang stolen from a Boomerang Rat."
    , kind = camp.ItemKind.Weapon
    , cost = 20
    , sellValue = Some 10
    }
