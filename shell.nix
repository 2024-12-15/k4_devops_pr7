{ pkgs, mkShell }:
mkShell {
  packages = with pkgs; [ clang-tools ];
}
