let camp = ../../package.dhall

in  camp.Item::{
    , name = "Longbow"
    , description =
        "A normal longbow to shoot baddies with. Has unlimited arrows."
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , cost = 50
    , sellValue = Some 20
    }
