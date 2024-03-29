let camp = ../../package.dhall

in  camp.Item::{
    , name = "Cactus Fruit"
    , description =
        "A sweet fruit from a cactus. You can juice them to act as emergency water."
    , kind = camp.ItemKind.Consumable
    , charges = Some 1
    , bonuses = [ camp.Bonus::{ amount = Some +6, stat = Some camp.Stat.HP } ]
    , cost = 5
    , sellValue = Some 1
    }
