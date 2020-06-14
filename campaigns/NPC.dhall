let Item = ./Item.dhall

in  { Type = { name : Text, job : Text, sellItems : List Item.Type }
    , default =
      { name = "no name", job = "no job", sellItems = [] : List Item.Type }
    }
