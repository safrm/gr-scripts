#!/bin/bash
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
#shows local tags versus current remote situation in subdirectories ./ or $1/ except those which are marked by "touch <dir>/.git/no_updates"

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
                LASTTAG=`git describe --tags --dirty=* 2> /dev/null`
                echo -e "\033[32m $ENTRY:\033[0m"
		BRANCH=`git branch | egrep "^\*" | cut -d' ' -f2`
		git fetch origin 
		git fetch origin --tags

                TO=`git describe origin/master --tags 2> /dev/null`

	        LASTMSG=`git log -1 --format="%s" `
                echo -e "\033[31m [$BRANCH] \033[0m local: \033[34m $LASTTAG \033[0m remote: \033[34m $TO \033[0m ($LASTMSG)"

		if [ "$LASTTAG" == "$TO" ]
		then
			NEEDS_UPDATE=""
		else
			NEEDS_UPDATE=" NEEDS UPDATE OR COMMIT"
                        echo -e "\033[33m$NEEDS_UPDATE\033[0m"
		fi
		cd $PROJECT_DIR
	fi
done

TIME=`date +%H:%M:%S`
echo "Showall finished:$TIME"

