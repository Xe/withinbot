let WinCondition = ../WinCondition.dhall

in  λ(winCondition : WinCondition.Type) →
      "Take the ${winCondition.item.name} to ${winCondition.area.humanName}"
