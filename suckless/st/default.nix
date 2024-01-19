{ nixpkgs }:

let
  scrollback_patch = nixpkgs.fetchurl {
    url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
    sha256 = "sha256-3H9SI7JvyBPZHUrjW9qlTWMCTK6fGK/Zs1lLozmd+lU=";
  };
in
  nixpkgs.stdenv.mkDerivation rec {
    pname = "st";
    version = "0.9";

    src = nixpkgs.fetchurl {
      url = "https://dl.suckless.org/st/st-${version}.tar.gz";
      sha256 = "sha256-82NZeZc06ueFvss3QGPwvoM88i+ItPFpzSUbmTJOCOc=";
    };

    # TODO: This patch doesn't work properly, fix it or stop using it
    patches = [ scrollback_patch ];

    config = ./config.h;
    sharedConfig = ../shared_config.h;

    buildInputs = with nixpkgs; [
      fontconfig
      freetype
      ncurses
      pkg-config
      xorg.libX11
      xorg.libXft
    ];

    prePatch = ''
      sed -i "s@/usr/local@$out@" config.mk
    '';

    postPatch = ''
      cp $sharedConfig ./shared_config.h
      cp $config ./config.h
    '';

    preInstall = ''
      export TERMINFO=$out/share/terminfo
    '';
  }
