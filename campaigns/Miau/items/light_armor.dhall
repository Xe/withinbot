let camp = ../../package.dhall

in  camp.Item::{
    , name = "Light Armor"
    , description = "Light armor that doesn't constrict movement."
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +1
        , area = None Text
        , stat = Some camp.Stat.DEF
        }
      ]
    , kind = camp.ItemKind.Armor
    , cost = 40
    , sellValue = Some 20
    }
