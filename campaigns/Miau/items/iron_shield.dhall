let camp = ../../package.dhall

in  camp.Item::{
    , name = "Iron Shield"
    , description = "A more powerful shield to protect you from damage."
    , weight = 1
    , kind = camp.ItemKind.Weapon
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +2
        , area = None Text
        , stat = Some camp.Stat.DEF
        }
      ]
    , cost = 40
    , sellValue = Some 20
    }
