let camp = ../../package.dhall

in  camp.Area::{
    , name = "start"
    , humanName = "Starting area"
    , description =
        "A clearing in the desert, there is a path to the west that leads towards the city of Cihan."
    , links = [ "cihan" ]
    , kind = "wasteland"
    }
