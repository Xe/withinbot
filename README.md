# withinbot

This is my Discord bot that is used in The Sub-Aesthetic Furryhole. I don't
expect other people to use this.

## Features

- Dice rolling
- Stat sheet creation for [6E](https://s-jared.itch.io/6e)
- Searches of [Furbooru](https://furbooru.org)
- Printer facts

This repository also contains the `six_e` crate, which is where I am attempting
to create my own role-playing game that would be mediated by a Discord bot. The
`campaigns` folder contains the data that would be used with that bot (I will
eventually also include a text-based frontend to this game engine).

## Testing

```
$ nix-shell --cmd "cargo test && cd ./six_e && cargo test"
```

## Building

```
$ nix-build
```

or to build the docker image:

```
$ nix-build docker.nix
```
