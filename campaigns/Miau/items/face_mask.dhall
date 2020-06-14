let camp = ../../package.dhall

in  camp.Item::{
    , name = "Face Mask"
    , description = "An enforcer of social distancing."
    , kind = camp.ItemKind.Armor
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.CHA } ]
    , cost = 40
    , sellValue = None Natural
    }
