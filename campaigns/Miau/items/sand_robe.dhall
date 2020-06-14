let camp = ../../package.dhall

in  camp.Item::{
    , name = "Sand Robe"
    , description = "blocks the sand from your body"
    , weight = 1
    , kind = camp.ItemKind.Armor
    , cost = 5
    , sellValue = None Natural
    }
