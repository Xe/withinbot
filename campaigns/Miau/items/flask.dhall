let camp = ../../package.dhall

in  camp.Item::{
    , name = "Flask"
    , description = "A flask of the good stuff."
    , kind = camp.ItemKind.Consumable
    , charges = Some 3
    , bonuses =
      [ camp.Bonus::{ amount = Some -2, stat = Some camp.Stat.CHA }
      , camp.Bonus::{ amount = Some +4, stat = Some camp.Stat.RISK }
      ]
    , cost = 30
    , sellValue = Some 10
    }
