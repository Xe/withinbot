let camp = ../../package.dhall

in  camp.Area::{
    , name = "tavern"
    , humanName = "Cihan tavern"
    , description =
        "The lively tavern of Cihan, there is a staircase on the northwest side of the building to the town inn."
    , links = [ "cihan", "inn" ]
    , kind = "town"
    }
