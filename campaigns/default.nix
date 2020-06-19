{ sources ? import ../nix/sources.nix, pkgs ? import sources.nixpkgs { }
, easy-dhall-nix ? import sources.easy-dhall-nix { }, stdenv ? pkgs.stdenv }:

stdenv.mkDerivation rec {
  name = "withinbot-campaigns";
  src = ./.;
  phases = "buildPhase installPhase";

  buildInputs = [ easy-dhall-nix.dhall-simple ];

  buildPhase = ''
    dhall resolve --file $src/Miau/package.dhall > Miau.dhall
  '';

  installPhase = ''
    mkdir -p $out

    cp -rf $src/types $out/types
    cp Miau.dhall $out/Miau.dhall
  '';
}
