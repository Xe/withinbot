let Stat = ./Stat.dhall

let Species = ./Species.dhall

let Roll = ./Roll.dhall

in  { Type =
        { stat : Optional Stat
        , amount : Optional Integer
        , area : Optional Text
        , when : Optional Roll.Type
        , species : Optional Species
        , polymorph : Optional Species
        }
    , default =
      { stat = None Stat
      , amount = None Integer
      , area = None Text
      , when = None Roll.Type
      , species = None Species
      , polymorph = None Species
      }
    }
