let toMD = { item = ./item.dhall, monster = ./monster.dhall }

let Area = ../Area.dhall

in  λ(area : Area.Type) →
      ''
      ### ${area.humanName}

      A ${area.kind} area.

      ${area.description}
      ''
