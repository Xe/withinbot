let camp = ../../package.dhall

in  camp.Item::{
    , name = "Mihari's Amulet"
    , description =
        "An amulet that grants the ability to polymorph into a feline. A blessing of the godess Mihari."
    , bonuses = [ camp.Bonus::{ polymorph = Some camp.Species.Feline } ]
    , cost = 0
    , legendary = True
    }
