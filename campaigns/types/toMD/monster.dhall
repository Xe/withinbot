let toMD = { roll = ./roll.dhall, monsterItem = ./monsterItem.dhall }

let Prelude = ../../Prelude.dhall

let Monster = ../Monster.dhall

let MonsterItem = ../MonsterItem.dhall

let Item = ../Item.dhall

in  λ(monster : Monster.Type) →
      let items =
            if    Prelude.Natural.greaterThan
                    (List/length MonsterItem.Type monster.items)
                    0
            then  let doer =
                        λ(item : MonsterItem.Type) →
                          "* ${toMD.monsterItem item}"

                  let showItems =
                        Prelude.Text.concatMapSep "\n" MonsterItem.Type doer

                  in  ''
                      Has the following items:
                      ${showItems monster.items}
                      ''
            else  ""

      let drops =
            if    Prelude.Natural.greaterThan
                    (List/length Item.Type monster.drops)
                    0
            then  let doer = λ(item : Item.Type) → "* ${item.name}"

                  let showItems = Prelude.Text.concatMapSep "\n" Item.Type doer

                  in  ''
                      Always drops the following items:
                      ${showItems monster.drops}
                      ''
            else  ""

      in  ''
          ### ${monster.name}

          ${Natural/show monster.hp} HP (${Natural/show monster.armor} armor)

          ${toMD.roll monster.damage} attack damage

          Grants ${Natural/show monster.exp} experience on defeat.

          ${items}

          ${drops}
          ''
