{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { }
, naersk ? pkgs.callPackage sources.naersk { } }:

let
  campaigns = pkgs.callPackage ./campaigns { };
  withinbot = naersk.buildPackage {
    src = builtins.filterSource
      (path: type: type != "directory" || builtins.baseNameOf path != "target")
      ./.;
    buildInputs = [ pkgs.openssl pkgs.pkg-config pkgs.sqlite ];
    doCheck = false;
  };

in pkgs.stdenv.mkDerivation {
  name = withinbot.name;

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${withinbot}/bin/withinbot $out/bin/withinbot
    ln -s ${campaigns} $out/campaigns
  '';
}
