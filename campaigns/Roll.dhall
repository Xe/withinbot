{ Type =
    { diceCount : Optional Natural
    , diceSides : Natural
    , min : Optional Natural
    , level : Bool
    , plus : Optional Integer
    }
, default =
  { diceCount = Some 1
  , diceSides = 6
  , min = None Natural
  , level = False
  , plus = None Integer
  }
}
