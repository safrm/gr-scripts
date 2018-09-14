#!/bin/sh
#git recursive directories scripts - http://safrm.net/projects/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
. appver-installer

appver_basic_scripts_test

$MKDIR_755 $BINDIR
$INSTALL_755 ./gr-authorcheck $BINDIR
appver_update_version_and_date $BINDIR/gr-authorcheck

$INSTALL_755 ./gr-branches $BINDIR
appver_update_version_and_date $BINDIR/gr-branches

$INSTALL_755 ./gr-changes $BINDIR
appver_update_version_and_date $BINDIR/gr-changes

$INSTALL_755 ./gr-clean $BINDIR
appver_update_version_and_date $BINDIR/gr-clean

$INSTALL_755 ./gr-commits2tag $BINDIR
appver_update_version_and_date $BINDIR/gr-commits2tag

$INSTALL_755 ./gr-gr $BINDIR
appver_update_version_and_date $BINDIR/gr-gr

$INSTALL_755 ./gr-initbare $BINDIR
appver_update_version_and_date $BINDIR/gr-initbare

$INSTALL_755 ./gr-pull $BINDIR
appver_update_version_and_date $BINDIR/gr-pull

$INSTALL_755 ./gr-pullreset $BINDIR
appver_update_version_and_date $BINDIR/gr-pullreset

$INSTALL_755 ./gr-remotes $BINDIR
appver_update_version_and_date $BINDIR/gr-remotes

$INSTALL_755 ./gr-show $BINDIR
appver_update_version_and_date $BINDIR/gr-show

$INSTALL_755 ./gr-showlocal $BINDIR
appver_update_version_and_date $BINDIR/gr-showlocal

$INSTALL_755 ./gr-tags $BINDIR
appver_update_version_and_date $BINDIR/gr-tags

$INSTALL_755 ./gr-update $BINDIR
appver_update_version_and_date $BINDIR/gr-update

$MKDIR_755 $COMPLETION_DIR
$INSTALL_755 ./gr-scripts_completion  $COMPLETION_DIR

