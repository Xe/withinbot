let Item = ./Item.dhall

let Area = ./Area.dhall

in  { Type = { item : Item.Type, area : Area.Type }
    , default = { item = Item::{=}, area = Area::{=} }
    }
