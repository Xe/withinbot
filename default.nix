{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { }
, naersk ? pkgs.callPackage sources.naersk { } }:

naersk.buildPackage {
  src = builtins.filterSource
    (path: type: type != "directory" || builtins.baseNameOf path != "target")
    ./.;
  buildInputs = [ pkgs.openssl pkgs.pkg-config pkgs.sqlite ];
  doCheck = false;
}
