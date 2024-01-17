let
  nixpkgs = import <nixpkgs> {};
in {
  urls = import ./urls { nixpkgs = nixpkgs; };
  tactful = import ./tactful { nixpkgs = nixpkgs; };
}
