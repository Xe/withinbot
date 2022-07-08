let toMD =
      { item = ./item.dhall
      , monster = ./monster.dhall
      , npc = ./npc.dhall
      , roll = ./roll.dhall
      }

let Prelude = ../../Prelude.dhall

let Area = ../Area.dhall

let NPC = ../NPC.dhall

let Monster = ../Monster.dhall

let Item = ../Item.dhall

in  λ(area : Area.Type) →
      let items =
            if    Prelude.Natural.greaterThan
                    (List/length Item.Type area.items)
                    0
            then  let doer =
                        λ(i : Item.Type) →
                          "* ${i.name} (${Natural/show i.cost})"

                  let showItems = Prelude.Text.concatMapSep "\n" Item.Type doer

                  in  ''
                      Has the following items out in the open:

                      ${showItems area.items}
                      ''
            else  ""

      let npcs =
            if    Prelude.Natural.greaterThan (List/length NPC.Type area.npcs) 0
            then  let showNPCs =
                        Prelude.Text.concatMapSep "\n\n" NPC.Type toMD.npc

                  in  ''
                      ## NPCs

                      ${showNPCs area.npcs}
                      ''
            else  ""

      let monsters =
            if    Prelude.Natural.greaterThan
                    (List/length Monster.Type area.monsters)
                    0
            then  let doer =
                        λ(m : Monster.Type) →
                          let hp = Natural/show m.hp

                          let def = Natural/show m.armor

                          let atk = toMD.roll m.damage

                          in  "* ${m.name} (${hp} HP, ${def} DEF, ${atk} ATK)"

                  let showMonsters =
                        Prelude.Text.concatMapSep "\n" Monster.Type doer

                  in  ''
                      Has the following monsters out in the open:

                      ${showMonsters area.monsters}
                      ''
            else  ""

      in  ''
          ### ${area.humanName}

          A ${area.kind} area.

          ${area.description}

          ${items}

          ${npcs}

          ${monsters}
          ''
