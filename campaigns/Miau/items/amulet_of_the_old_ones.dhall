let camp = ../../package.dhall

in  camp.Item::{
    , name = "Amulet of The Old Ones"
    , description =
        "An amulet imbued with the power of The Old Ones, increasing wisdom."
    , bonuses = [ camp.Bonus::{ amount = Some +1, stat = Some camp.Stat.WIS } ]
    , cost = 30
    , sellValue = Some 4
    }
