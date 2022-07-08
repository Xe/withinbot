let toMD = { species = ./species.dhall, item = ./item.dhall }

let Prelude = ../../Prelude.dhall

let NPC = ../NPC.dhall

let Item = ../Item.dhall

in  λ(npc : NPC.Type) →
      let items =
            if    Prelude.Natural.greaterThan
                    (List/length Item.Type npc.sellItems)
                    0
            then  let doer =
                        λ(i : Item.Type) →
                          "* ${i.name} (${Natural/show i.cost} gold)"

                  let showItems = Prelude.Text.concatMapSep "\n" Item.Type doer

                  in  ''
                      Has the following items for sale:

                      ${showItems npc.sellItems}
                      ''
            else  ""

      let dialogue =
            if    Prelude.Natural.greaterThan (List/length Text npc.dialogue) 0
            then  let showDia =
                        Prelude.Text.concatMapSep
                          "\n"
                          Text
                          (λ(t : Text) → "* ${t}")

                  in  ''
                      Dialogue:

                      ${showDia npc.dialogue}
                      ''
            else  ""

      in  ''
          #### ${npc.name}

          A ${toMD.species npc.species} ${npc.job}.

          ${items}

          ${dialogue}
          ''
