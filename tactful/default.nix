{ nixpkgs }:

nixpkgs.rustPlatform.buildRustPackage {
  pname = "tactful";
  version = "0.1.0-test";

  src = nixpkgs.fetchFromGitHub {
    owner = "darkfireZZ";
    repo = "tactful";
    rev = "e41a3bc54e4e4f29aa10eaab3f3d6277052a1c9c";
    sha256 = "sha256-5CojAut6JGcE959/kLX9VrtlVUua9sFKTZ7RQ8ZcnoU=";
  };

  cargoSha256 = "sha256-ABIzpVYbrbLZxtPdPLVy0DPsLElj+ODZI0nizwGNuoI=";
}
