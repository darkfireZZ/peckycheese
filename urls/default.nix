{ nixpkgs }:

let
  version = "0.1.0-test";
in
  derivation {
    name = "urls-${version}";
    builder = "${nixpkgs.bash}/bin/bash";
    args = [ ./builder.sh ];
    system = "x86_64-linux";

    src = nixpkgs.fetchFromGitHub {
      owner = "darkfireZZ";
      repo = "urls";
      rev = "0c5c3f4356ec1b70bc90f4c8e136dc998cdcbd06";
      hash = "sha256-N0iLXopy2zwGG8I4GIcmCOGk+5nQ1d+TpLtb4m/fTsg=";
    };
    inherit (nixpkgs) coreutils gcc gnumake;
  }
