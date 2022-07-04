let Roll = ../Roll.dhall

in  λ(roll : Roll.Type) →
      let diceCount =
            if    roll.level
            then  "user's level "
            else  merge { None = "", Some = Natural/show } roll.diceCount

      let plus =
            merge
              { None = "", Some = λ(plus : Natural) → "+${Natural/show plus}" }
              roll.plus

      let minimum =
            merge
              { None = ""
              , Some =
                  λ(minus : Natural) →
                    " is greater than or equal to ${Natural/show minus}"
              }
              roll.min

      in  "${diceCount}d${Natural/show roll.diceSides}${plus}${minimum}"
