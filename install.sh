#/bin/sh
#git recursive directories scripts - http://safrm.net/projects/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
BINDIR=/usr/bin/
COMPLETION_DIR=/etc/bash_completion.d
MANDIR=/usr/share/man

#root check
[ `id -u` -ne 0 ] && [ `uname -s | grep -i linux` ] && {
    echo "I cannot continue, you should be root or run it with sudo!"
    exit 0
}
if command -v install 1>/dev/null 2>&1 ; then
    INSTALL_755="install -m 0755 -v " ; INSTALL_644="install -m 0644 -v "
else
    INSTALL_755="cp -afv " ; INSTALL_644="cp -afv "
fi

#automatic version
if command -v appver 1>/dev/null 2>&1 ; then . appver ; else APP_SHORT_VERSION=NA ; APP_FULL_VERSION_TAG=NA ; APP_BUILD_DATE=`date +'%Y%m%d_%H%M'` ; fi

#test
for TEST in $(  grep -r -l -h "#\!/bin/sh"  --exclude-dir=.git . )
do
    sh -n $TEST
    if  [ $? != 0 ]; then
        echo "syntax error in $TEST, exiting.."
        exit 1
	fi
done

#update documentation
jss-docs-update ./doc 

mkdir -p -m 0755 $BINDIR
$INSTALL_755 ./gr-authorcheck $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-authorcheck  && rm -f $BINDIR/gr-authorcheck.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-authorcheck  && rm -f $BINDIR/gr-authorcheck.bkp
$INSTALL_755 ./gr-branches $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-branches && rm -f $BINDIR/gr-branches.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-branches && rm -f $BINDIR/gr-branches.bkp
$INSTALL_755 ./gr-clean $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-clean && rm -f $BINDIR/gr-clean.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-clean && rm -f $BINDIR/gr-clean.bkp
$INSTALL_755 ./gr-commits2tag $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-commits2tag && rm -f $BINDIR/gr-commits2tag.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-commits2tag && rm -f $BINDIR/gr-commits2tag.bkp
$INSTALL_755 ./gr-pull $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-pull && rm -f $BINDIR/gr-pull.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-pull && rm -f $BINDIR/gr-pull.bkp
$INSTALL_755 ./gr-pullreset $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-pullreset && rm -f $BINDIR/gr-pullreset.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-pullreset && rm -f $BINDIR/gr-pullreset.bkp
$INSTALL_755 ./gr-remotes $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-remotes && rm -f $BINDIR/gr-remotes.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-remotes && rm -f $BINDIR/gr-remotes.bkp
$INSTALL_755 ./gr-show $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-show  && rm -f $BINDIR/gr-show.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-show  && rm -f $BINDIR/gr-show.bkp
$INSTALL_755 ./gr-showlocal $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-showlocal  && rm -f $BINDIR/gr-showlocal.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-showlocal  && rm -f $BINDIR/gr-showlocal.bkp
$INSTALL_755 ./gr-initbare $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-initbare  && rm -f $BINDIR/gr-initbare.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-initbare  && rm -f $BINDIR/gr-initbare.bkp
$INSTALL_755 ./gr-tags $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-tags  && rm -f $BINDIR/gr-tags.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-tags  && rm -f $BINDIR/gr-tags.bkp
$INSTALL_755 ./gr-changes $BINDIR
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gr-changes  && rm -f $BINDIR/gr-changes.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gr-changes  && rm -f $BINDIR/gr-changes.bkp

mkdir -p -m 0755 $COMPLETION_DIR
$INSTALL_755 ./gr-scripts_completion  $COMPLETION_DIR/

MANPAGES=`find ./doc/manpages -type f`
mkdir -p -m 755 $MANDIR/man1
$INSTALL_644 $MANPAGES $MANDIR/man1

