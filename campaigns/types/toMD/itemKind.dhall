let ItemKind = ../ItemKind.dhall

let show =
      λ(ik : ItemKind) →
        merge
          { Weapon = "Weapon"
          , Armor = "Armor"
          , Trinket = "Trinket"
          , Gear = "Gear"
          , Consumable = "Consumable"
          }
          ik

in  show
