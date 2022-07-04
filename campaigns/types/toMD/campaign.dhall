let toMD =
      { area = ./area.dhall
      , monster = ./monster.dhall
      , item = ./item.dhall
      , winCondition = ./winCondition.dhall
      }

let Prelude = ../../Prelude.dhall

let Area = ../Area.dhall

let Campaign = ../Campaign.dhall

let Monster = ../Monster.dhall

let Item = ../Item.dhall

in  λ(camp : Campaign.Type) →
      let areas = Prelude.Text.concatMapSep "\n" Area.Type toMD.area

      let monsters = Prelude.Text.concatMapSep "\n" Monster.Type toMD.monster

      let items = Prelude.Text.concatMapSep "\n" Item.Type toMD.item

      in  ''
          # ${camp.name}

          ${camp.description}

          ## Win Condition

          ${toMD.winCondition camp.winCondition}

          ## Areas

          ${areas camp.areas}

          ## Monsters

          ${monsters camp.monsters}

          ## Items

          ${items camp.items}
          ''
