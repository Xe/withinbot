let Species = ../Species.dhall

in  λ(species : Species) →
      merge
        { Human = "Human"
        , Feline = "Feline"
        , Shark = "Shark"
        , Cetacean = "Cetacean"
        }
        species
