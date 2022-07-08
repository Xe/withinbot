let camp = ../../package.dhall

let ownerName = "Cell"

in  camp.Area::{
    , name = "armor_shop"
    , humanName = "${ownerName} the Armorweaver"
    , description =
        ''
        The foremost armor shop in Cihan. ${ownerName} has run this shop for years and his son is his apprentice.

        The store is very plain, not messing around. There is room for 4 people to browse around and shop.''
    , links = [ "cihan" ]
    , npcs =
      [ camp.NPC::{
        , name = "${ownerName}"
        , job = "Armorweaver"
        , sellItems =
          [ ../items/sandshoes.dhall
          , ../items/sand_robe.dhall
          , ../items/light_armor.dhall
          ]
        , dialogue =
          [ "[if there is a femme player character in the party] My son has been working on some armor you may find useful. You should talk with him and see if he'll part with it. It'll probably do wonders for your charm~ (purr)"
          ]
        }
      , camp.NPC::{
        , name = "${ownerName}'s son Cial"
        , job = "Apprentice Armorweaver"
        , sellItems = [ ../items/maiden_armor.dhall ]
        , dialogue =
          [ "I've been learning armorweaving for 5 years. I have a long way to go."
          , "If you find any enchanted amulets you don't want, let me know. If you can find one that I'm really looking for I will pay a pretty penny."
          ]
        }
      ]
    , kind = "store"
    }
