let Monster = ./Monster.dhall

let NPC = ./NPC.dhall

let Item = ./Item.dhall

in  { Type =
        { name : Text
        , humanName : Text
        , description : Text
        , links : List Text
        , monsters : List Monster.Type
        , npcs : List NPC.Type
        , items : List Item.Type
        , kind : Text
        }
    , default =
      { name = "unnamed"
      , humanName = "unnamed area"
      , description = "fill me in please"
      , links = [] : List Text
      , monsters = [] : List Monster.Type
      , npcs = [] : List NPC.Type
      , items = [] : List Item.Type
      , kind = ""
      }
    }
