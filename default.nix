let
  nixpkgs = import <nixpkgs> {};
in {
  urls = import ./urls { nixpkgs = nixpkgs; };
}
