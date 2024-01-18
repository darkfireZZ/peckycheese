{ nixpkgs }:

nixpkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.4";

  src = nixpkgs.fetchurl {
    url = "https://dl.suckless.org/dwm/dwm-${version}.tar.gz";
    sha256 = "sha256-+pwNaaWESFB2z8GICf1wXlwggNr7E9XnKaNkbKdwOm4=";
  };

  config = ./config.h;
  sharedConfig = ../shared_config.h;

  buildInputs = with nixpkgs; [
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  prePatch = ''
    sed -i "s@/usr/local@$out@" config.mk
  '';

  postPatch = ''
    cp $sharedConfig ./shared_config.h
    cp $config ./config.h
  '';
}
