let Bonus = ./Bonus.dhall

let ItemKind = ./ItemKind.dhall

in  { Type =
        { name : Text
        , description : Text
        , weight : Natural
        , kind : ItemKind
        , bonuses : List Bonus.Type
        , cost : Natural
        , sellValue : Optional Natural
        , charges : Optional Natural
        , legendary : Bool
        }
    , default =
      { name = "no name"
      , description = "no description"
      , weight = 1
      , kind = ItemKind.Trinket
      , bonuses = [] : List Bonus.Type
      , cost = 0
      , sellValue = None Natural
      , charges = None Natural
      , legendary = False
      }
    }
