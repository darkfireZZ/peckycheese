let
  nixpkgs = import <nixpkgs> {};
in {
  anypinentry = import ./anypinentry { nixpkgs = nixpkgs; };
  urls = import ./urls { nixpkgs = nixpkgs; };
  tactful = import ./tactful { nixpkgs = nixpkgs; };
}
