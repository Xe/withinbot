let camp = ../../package.dhall

in  camp.Item::{
    , name = "Ration"
    , description = "Standard rations to restore HP"
    , kind = camp.ItemKind.Consumable
    , bonuses =
      [ camp.Bonus::{
        , stat = Some camp.Stat.HP
        , when = Some camp.Roll::{ diceSides = 6, level = True }
        }
      ]
    , charges = Some 1
    , cost = 5
    , sellValue = None Natural
    }
