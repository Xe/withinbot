let town = [ ./cihan.dhall, ./tavern.dhall, ./inn.dhall ]

let wasteland = [ ./start.dhall ]

in  wasteland # town
