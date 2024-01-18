{ nixpkgs }:

# This derivation is adapted from the dmenu in nixpkgs
#
# For now, the only difference to the nixpkgs version is that the password
# patch is applied to dmenu. The password patch is adapted to work with version
# 5.2 of dmenu.
#
# See also: https://tools.suckless.org/dmenu/patches/password/ 
nixpkgs.stdenv.mkDerivation rec {
  pname = "dmenu";
  version = "5.2";

  src = nixpkgs.fetchurl {
    url = "https://dl.suckless.org/tools/dmenu-${version}.tar.gz";
    sha256 = "sha256-1NTKd7WRQPJyJy21N+BbuRpZFPVoAmUtxX5hp3PUN5I=";
  };

  buildInputs = with nixpkgs; [
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  patches = [ ./password_patch ];

  postPatch = ''
    sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
    sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
  '';

  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';
}
