let Bonus = ../Bonus.dhall

let Stat = ../Stat.dhall

let Species = ../Species.dhall

let Roll = ../Roll.dhall

let Prelude = ../../Prelude.dhall

let toMD =
      { stat = ./stat.dhall, species = ./species.dhall, roll = ./roll.dhall }

in  λ(bonus : Bonus.Type) →
      let stat = merge { None = "", Some = toMD.stat } bonus.stat

      let amount =
            merge
              { None = ""
              , Some =
                  λ(amount : Integer) →
                    if    Prelude.Integer.greaterThan amount +0
                    then  " ${Integer/show amount} "
                    else  " ${Integer/show amount} "
              }
              bonus.amount

      let area =
            merge
              { None = "", Some = λ(area : Text) → " when in ${area} " }
              bonus.area

      let polymorph =
            merge
              { None = ""
              , Some =
                  λ(species : Species) → " polymorph to ${toMD.species species}"
              }
              bonus.polymorph

      let condition =
            merge
              { None = ""
              , Some = λ(roll : Roll.Type) → " if ${toMD.roll roll}"
              }
              bonus.when

      in  "Grants${amount}${stat}${area}${polymorph}${condition}"
