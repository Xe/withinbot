let MonsterItem = ./MonsterItem.dhall

let Item = ./Item.dhall

let Range = ./Range.dhall

let Roll = ./Roll.dhall

in  { Type =
        { name : Text
        , damage : Roll.Type
        , hp : Natural
        , armor : Natural
        , exp : Natural
        , items : List MonsterItem.Type
        , drops : List Item.Type
        }
    , default =
      { name = "unnamed"
      , damage = Roll::{=}
      , hp = 1
      , armor = 0
      , exp = 25
      , items = [] : List MonsterItem.Type
      , drops = [] : List Item.Type
      }
    }
