let MonsterItem = ./MonsterItem.dhall

let Item = ./Item.dhall

let Range = ./Range.dhall

let Roll = ./Roll.dhall

in  { Type =
        { name : Text
        , damage : Roll.Type
        , hp : Range.Type
        , armor : Natural
        , exp : Roll.Type
        , items : List MonsterItem.Type
        , drops : List Item.Type
        }
    , default =
      { name = "unnamed"
      , damage = Roll::{=}
      , hp = Range::{=}
      , armor = 0
      , exp = Roll::{=}
      , items = [] : List MonsterItem.Type
      , drops = [] : List Item.Type
      }
    }
