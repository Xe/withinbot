let pkgs = import <nixpkgs> { };
in pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    rls
    rustfmt
    cargo-watch
    pkg-config
    openssl
    sqlite
    niv
  ];
}
