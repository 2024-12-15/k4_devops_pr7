{ stdenv }:
stdenv.mkDerivation {
  pname = "my-hello";
  version = "0.0.0";
  src = ./.;
  buildPhase = ''
    mkdir build
    clang src/main.c -o build/main
  '';
  installPhase = ''
    cp build/main $out
  '';
}
