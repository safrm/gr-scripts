#/bin/sh
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
BINDIR=/usr/bin/

sudo mkdir -p -m 0755 $BINDIR
sudo install -m 0777 -v ./gr-branches $BINDIR
sudo install -m 0777 -v ./gr-clean $BINDIR
sudo install -m 0777 -v ./gr-pull $BINDIR
sudo install -m 0777 -v ./gr-pullreset $BINDIR
sudo install -m 0777 -v ./gr-remotes $BINDIR
sudo install -m 0777 -v ./gr-show $BINDIR
sudo install -m 0777 -v ./gr-showlocal $BINDIR
