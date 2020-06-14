let Stat = ./Stat.dhall

let Roll = ./Roll.dhall

in  { Type =
        { stat : Optional Stat
        , amount : Optional Integer
        , area : Optional Text
        , when : Optional Roll.Type
        }
    , default =
      { stat = None Stat
      , amount = None Integer
      , area = None Text
      , when = None Roll.Type
      }
    }
