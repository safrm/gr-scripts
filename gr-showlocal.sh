#!/bin/bash
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
#shows local tags and if it was edited in subdirectories ./ or $1/ except those which are marked by "touch <dir>/.git/no_updates"

PROJECT_DIR="$1"
if [ -z "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR" ]; then
	PROJECT_DIR="./"
fi

CWD=`pwd`
cd $PROJECT_DIR
PROJECT_DIR=`pwd`

find ./  -type d -name ".git*"  |  sed 's/\/.git//g' | while read ENTRY
do
	if [ ! -f $ENTRY/.git/no_updates ]; then
		cd $ENTRY 
                LASTTAG=`git describe --tags --dirty=*  2> /dev/null`
                echo -e "\033[32m $ENTRY:\033[0m \033[34m $LASTTAG \033[0m"
		LASTMSG=`git log -1 --pretty=format:'%h %s | %ad' --date=relative`
                echo -e "$LASTMSG"
		cd $PROJECT_DIR
	fi
done

TIME=`date +%H:%M:%S`
echo "Showlocal finished:$TIME"



