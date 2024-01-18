{ nixpkgs }:

# Derivation for my personalized version of dmenu.
#
# Changes the appearance of dmenu and applies the password patch. The password
# patch is adapted to work with version 5.2 of dmenu.
#
# The password patch is adapted from here:
# https://tools.suckless.org/dmenu/patches/password/
nixpkgs.stdenv.mkDerivation rec {
  pname = "dmenu";
  version = "5.2";

  src = nixpkgs.fetchurl {
    url = "https://dl.suckless.org/tools/dmenu-${version}.tar.gz";
    sha256 = "sha256-1NTKd7WRQPJyJy21N+BbuRpZFPVoAmUtxX5hp3PUN5I=";
  };

  config = ./config.h;
  sharedConfig = ../shared_config.h;

  buildInputs = with nixpkgs; [
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  patches = [ ./password_patch ];

  postPatch = ''
    sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
    sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
    cp $sharedConfig ./shared_config.h
    cp $config ./config.h
  '';

  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';
}
