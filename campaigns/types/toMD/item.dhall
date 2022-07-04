let toMD = { itemKind = ./itemKind.dhall, bonus = ./bonus.dhall }

let Prelude = ../../Prelude.dhall

let Item = ../Item.dhall

let Bonus = ../Bonus.dhall

in  λ(item : Item.Type) →
      let bonuses =
            if    Prelude.Natural.greaterThan
                    (List/length Bonus.Type item.bonuses)
                    0
            then  let doer = λ(bonus : Bonus.Type) → "* ${toMD.bonus bonus}"

                  let showItems = Prelude.Text.concatMapSep "\n" Bonus.Type doer

                  in  ''
                      Grants the following bonuses:

                      ${showItems item.bonuses}
                      ''
            else  ""

      let legendary = if item.legendary then "(legendary item)" else ""

      let charges =
            merge
              { None = ""
              , Some =
                  λ(charges : Natural) →
                    ''

                    Has a maximum of ${Natural/show charges} charges.
                    ''
              }
              item.charges

      let sellPrice =
            merge
              { None = "Unsellable"
              , Some =
                  λ(price : Natural) → "Sells for ${Natural/show price} gold."
              }
              item.sellValue

      in  ''
          ### ${item.name}

          ${toMD.itemKind item.kind} ${legendary} ${charges}

          Weight: ${Natural/show item.weight}

          ${item.description}

          ${bonuses}

          Buy price: ${Natural/show item.cost} gold

          ${sellPrice}
          ''
