{ nixpkgs }:

nixpkgs.stdenv.mkDerivation {
  name = "anypinentry";
  src = nixpkgs.fetchFromGitHub {
    owner = "phenax";
    repo = "any-pinentry";
    rev = "3302995faca21c4b003a517c4dae12ef8d7f7971";
    hash = "sha256-W9tgeoD2drmuucWaFatLbq39i57EedyiKkWKn5wADK0=";
  };
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/anypinentry $out/bin
  '';
}
