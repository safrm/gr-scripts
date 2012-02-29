#/bin/sh
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
BINDIR=/usr/bin/

sudo mkdir -p -m 0755 $BINDIR
sudo install -m 0777 -v ./gr-*  $BINDIR
