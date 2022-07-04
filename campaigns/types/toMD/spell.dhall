let toMD = { stat = ./stat.dhall, roll = ./roll.dhall }

let Spell = ../Spell.dhall

in  λ(spell : Spell.Type) →
      ''
      ### ${spell.name} (${toMD.stat spell.stat})

      ${spell.description}

      Deals ${toMD.roll spell.damage}
      ''
