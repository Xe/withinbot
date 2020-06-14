let armor =
      [ ./face_mask.dhall
      , ./maiden_armor.dhall
      , ./mihari_armor.dhall
      , ./light_armor.dhall
      , ./sand_robe.dhall
      , ./sandshoes.dhall
      ]

let weapons =
      [ ./bane_of_lizards_shortsword.dhall
      , ./battleaxe.dhall
      , ./blessed_dagger_of_stabbing.dhall
      , ./boomerang.dhall
      , ./dagger.dhall
      , ./greatbow.dhall
      , ./greatsword.dhall
      , ./longbow.dhall
      , ./longsword.dhall
      , ./shortsword.dhall
      , ./super_boomerang.dhall
      , ./sword_of_two_truths.dhall
      , ./tolkath_battleaxe.dhall
      , ./whisperwind.dhall
      , ./iron_shield.dhall
      , ./shield.dhall
      ]

let trinkets = [ ./amulet_of_bandacy.dhall, ./mihari_amulet.dhall ]

let consumables =
      [ ./cactus_fruit.dhall
      , ./flask.dhall
      , ./hydroflask.dhall
      , ./ration.dhall
      ]

let gear = [ ./torch.dhall ]

in  armor # weapons # consumables # gear # trinkets
