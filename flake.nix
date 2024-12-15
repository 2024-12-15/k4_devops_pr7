{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    futils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      futils,
    }:
    futils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        inherit (pkgs) callPackage;
        mkShell = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; };
      in
      {

        devShells.default = callPackage ./shell.nix { inherit mkShell; };

        packages.default = callPackage ./package.nix { stdenv = pkgs.clangStdenv; };

      }
    );
}
