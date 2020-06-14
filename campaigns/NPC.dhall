let Item = ./Item.dhall

let Species = ./Species.dhall

in  { Type =
        { name : Text
        , job : Text
        , sellItems : List Item.Type
        , species : Species
        , dialogue : List Text
        }
    , default =
      { name = "no name"
      , job = "no job"
      , sellItems = [] : List Item.Type
      , species = Species.Feline
      , dialogue = [] : List Text
      }
    }
