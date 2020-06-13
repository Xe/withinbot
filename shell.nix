let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  niv = (import sources.niv { }).niv;
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

    # tooling
    niv
  ];

  DATABASE_URL = "target/withinbot.db";
}
