let Stat = ../Stat.dhall

in  λ(stat : Stat) →
      merge
        { STR = "STR"
        , DEX = "DEX"
        , CON = "CON"
        , INT = "INT"
        , WIS = "WIS"
        , CHA = "CHA"
        , ATK = "ATK"
        , DEF = "DEF"
        , RISK = "RISK"
        , HP = "HP"
        }
        stat
