{ system ? builtins.currentSystem }:

let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  callPackage = pkgs.lib.callPackageWith pkgs;
  withinbot = callPackage ./default.nix { };

  dockerImage = pkg:
    pkgs.dockerTools.buildLayeredImage {
      name = "xena/withinbot";
      tag = pkg.version;

      contents = [ pkg ];

      config = {
        Cmd = [ "/bin/withinbot" ];
        WorkingDir = "/";
      };
    };

in dockerImage withinbot
