let camp = ../package.dhall

in  camp.Campaign::{
    , name = "Sands of Miau"
    , description =
        "In the desert of Miau, the town of Cihan has been cut off from trade with other towns due to weirdly strong sandstorms after an amulet was stolen from that town by the bandit leader Tol'Kath. Your goal is to venture through the wasteland and the ruins of Ci in order to get the amulet back and add yourselves to the scroll of legends for Cihan."
    , areas = ./areas/package.dhall
    , monsters = ./monsters/package.dhall
    , items = ./items/package.dhall
    , winCondition = ./winCondition.dhall
    }
