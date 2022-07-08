let town = [ ./cihan.dhall, ./armor_shop.dhall, ./tavern.dhall, ./inn.dhall ]

let wasteland = [ ./start.dhall ]

in  wasteland # town
