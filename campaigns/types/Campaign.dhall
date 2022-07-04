let Area = ./Area.dhall

let Monster = ./Monster.dhall

let Item = ./Item.dhall

let WinCondition = ./WinCondition.dhall

in  { Type =
        { name : Text
        , description : Text
        , areas : List Area.Type
        , monsters : List Monster.Type
        , items : List Item.Type
        , winCondition : WinCondition.Type
        }
    , default =
      { name = "none"
      , description = "fill me in"
      , areas = [] : List Area.Type
      , monsters = [] : List Monster.Type
      , items = [] : List Item.Type
      , winCondition = WinCondition::{=}
      }
    }
