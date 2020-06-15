let camp = ../../package.dhall

in  camp.Area::{
    , name = "cihan"
    , humanName = "town square of Cihan"
    , description =
        "The town square of Cihan. There is a lot of hustle and bustle with activity as people go about their lives."
    , links =
      [ "start", "palace", "inn", "armor_shop", "weapon_shop", "market" ]
    , kind = "town"
    }
