let camp = ../../package.dhall

in  camp.Area::{
    , name = "inn"
    , humanName = "Cihan inn"
    , description =
        "The inn of Cihan, you can stay here for 5 gold per night, or maybe for less if you're lucky."
    , links = [ "tavern" ]
    , kind = "town"
    }
