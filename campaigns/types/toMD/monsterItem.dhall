let toMD = { item = ./item.dhall, roll = ./roll.dhall }

let MonsterItem = ../MonsterItem.dhall

let Roll = ../Roll.dhall

in  λ(monsterItem : MonsterItem.Type) →
      let roll =
            merge
              { None = ""
              , Some = λ(dice : Roll.Type) → " drops if ${toMD.roll dice}"
              }
              monsterItem.dice

      in  "${monsterItem.item.name}${roll}"
