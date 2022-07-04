let toMD = { species = ./species.dhall }

let Prelude = ../../Prelude.dhall

let NPC = ../NPC.dhall

in  λ(npc : NPC.Type) →
      ''
      #### ${npc.name}

      A ${toMD.species npc.species} ${npc.job}.
      ''
