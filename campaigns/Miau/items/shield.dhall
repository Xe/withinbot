let camp = ../../package.dhall

in  camp.Item::{
    , name = "Wooden Shield"
    , description = "A normal shield to protect you from damage."
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +1
        , area = None Text
        , stat = Some camp.Stat.DEF
        }
      ]
    , cost = 25
    , sellValue = Some 10
    }
