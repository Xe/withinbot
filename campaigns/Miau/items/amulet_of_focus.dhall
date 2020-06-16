let camp = ../../package.dhall

in  camp.Item::{
    , name = "Amulet of Focus"
    , description =
        "An amulet that increases the ability to focus, boosting intelligence."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.INT } ]
    , cost = 30
    , sellValue = Some 4
    }
