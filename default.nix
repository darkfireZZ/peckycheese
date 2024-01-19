let
  nixpkgs = import <nixpkgs> {};
in {
  anypinentry = import ./anypinentry { nixpkgs = nixpkgs; };
  dmenu = import ./suckless/dmenu { nixpkgs = nixpkgs; };
  dwm = import ./suckless/dwm { nixpkgs = nixpkgs; };
  urls = import ./urls { nixpkgs = nixpkgs; };
  st = import ./suckless/st { nixpkgs = nixpkgs; };
  tactful = import ./tactful { nixpkgs = nixpkgs; };
}
