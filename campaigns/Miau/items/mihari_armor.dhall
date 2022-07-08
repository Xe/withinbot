let camp = ../../package.dhall

in  camp.Item::{
    , name = "Mihari's Armor"
    , description =
        "Armor fit for a goddess. Gives massive bonuses for defense and charisma to felines. Can cause the wearer to be mistaken as high society member."
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +2
        , stat = Some camp.Stat.CHA
        , species = Some camp.Species.Feline
        }
      , camp.Bonus::{
        , amount = Some +4
        , stat = Some camp.Stat.DEF
        , species = Some camp.Species.Feline
        }
      ]
    , weight = 1
    , kind = camp.ItemKind.Armor
    , cost = 300
    , sellValue = Some 250
    , legendary = True
    }
