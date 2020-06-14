let camp = ../../package.dhall

in  camp.Item::{
    , name = "Blessed Dagger of Stabbing"
    , description =
        "This blessed dagger is said to be once owned by a legendary purple warrior. Can be used in your offhand for a second attack."
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , cost = 60
    , sellValue = Some 50
    , legendary = True
    }
