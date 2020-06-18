let Stat = ./Stat.dhall

let Roll = ./Roll.dhall

in  { Type =
        { stat : Stat, name : Text, description : Text, damage : Roll.Type }
    , default =
      { stat = Stat.INT
      , name = "no name"
      , description = "no description"
      , damage = Roll::{=}
      }
    }
