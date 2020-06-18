let Area = ./Area.dhall

let Monster = ./Monster.dhall

in  { Type = { name : Text, description : Text, areas : List Area.Type }
    , default =
      { name = "none", description = "fill me in", areas = [] : List Area.Type }
    }
