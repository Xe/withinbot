let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  niv = (import sources.niv { }).niv;
  dhall = import sources.easy-dhall-nix { };
in with pkgs;

pkgs.mkShell {
  nativeBuildInputs = [ removeReferencesTo ];
  buildInputs = [
    # rust dependencies
    cargo
    cargo-watch
    rls
    rustc
    rustfmt

    # native dependencies
    openssl
    pkg-config
    sqlite

    # dhall
    dhall.dhall-simple
    dhall.dhall-json-simple
    dhall.dhall-lsp-simple

    # tooling
    niv
    diesel-cli
  ];

  DATABASE_URL = "target/withinbot.db";
}
