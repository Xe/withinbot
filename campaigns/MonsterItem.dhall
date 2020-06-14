let Item = ./Item.dhall

let Roll = ./Roll.dhall

in  { Type = { dice : Optional Roll.Type, item : Item.Type }
    , default = { dice = None Roll.Type, item = Item::{=} }
    }
