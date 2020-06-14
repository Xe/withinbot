let camp = ../../package.dhall

in  camp.Item::{
    , name = "Sandshoes"
    , description = "Shoes that help you walk in the dunes"
    , weight = 1
    , kind = camp.ItemKind.Armor
    , bonuses =
      [ camp.Bonus::{
        , stat = Some camp.Stat.DEX
        , amount = Some +1
        , area = Some "wasteland"
        }
      ]
    , cost = 15
    , sellValue = Some 2
    }
