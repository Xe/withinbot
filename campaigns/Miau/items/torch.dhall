let camp = ../../package.dhall

in  camp.Item::{
    , name = "Torch"
    , description = "A torch to light dark caves"
    , weight = 1
    , kind = camp.ItemKind.Gear
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +2
        , area = Some "cave"
        , stat = Some camp.Stat.RISK
        }
      ]
    , cost = 10
    }
