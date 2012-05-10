#/bin/sh
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
BINDIR=/usr/bin/

#root check
USERID=`id -u`
[ $USERID -eq "0" ] || { 
    echo "I cannot continue, you should be root or run it with sudo!"
    exit 0
}
#automatic version 
. appver || APP_FULL_VERSION_TAG=NA

mkdir -p -m 0755 $BINDIR
install -m 0777 -v ./gr-branches $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-branches && rm -f $BINDIR/gr-branches.bkp
install -m 0777 -v ./gr-clean $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-clean && rm -f $BINDIR/gr-clean.bkp
install -m 0777 -v ./gr-pull $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-pull && rm -f $BINDIR/gr-pull.bkp
install -m 0777 -v ./gr-pullreset $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-pullreset && rm -f $BINDIR/gr-pullreset.bkp
install -m 0777 -v ./gr-remotes $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-remotes && rm -f $BINDIR/gr-remotes.bkp
install -m 0777 -v ./gr-show $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-show  && rm -f $BINDIR/gr-show.bkp
install -m 0777 -v ./gr-showlocal $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-showlocal  && rm -f $BINDIR/gr-showlocal.bkp
