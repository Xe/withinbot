let camp = ../../package.dhall

in  camp.Item::{
    , name = "Maiden armor"
    , description =
        ''
        Attractive armor for an attractive woman.

        Gives you extra charisma in town areas, but it may also make you appear more femme to certain people.''
    , bonuses =
      [ camp.Bonus::{
        , amount = Some +2
        , area = Some "town"
        , stat = Some camp.Stat.CHA
        }
      , camp.Bonus::{ amount = Some -1, stat = Some camp.Stat.DEF }
      ]
    , weight = 1
    , kind = camp.ItemKind.Armor
    , cost = 30
    , sellValue = Some 10
    , legendary = True
    }
