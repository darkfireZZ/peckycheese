#!/bin/sh

export PATH="$coreutils/bin:$gcc/bin:$gnumake/bin"

cp -r $src/* .
make
mkdir -p $out/bin
mv ./build/urls $out/bin/urls

mkdir -p $out/share/man/man1
mv urls.1 $out/share/man/man1
