#!/bin/bash
#git recursive directories scripts - https://github.com/safrm/gr-scripts
#version: 1.0
#author:  Miroslav Safr miroslav.safr@gmail.com
#cleans up git clones in all subdirectories ./ or $1/ except those which are marked by "touch <dir>/.git/no_updates"

PROJECT_DIR="$1"
if [ -z "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR" ]; then
	PROJECT_DIR="./"
fi

CWD=`pwd`
cd $PROJECT_DIR
PROJECT_DIR=`pwd`

ls | while read ENTRY
do
	if [ -d $ENTRY ] && [ -d $ENTRY/.git ]; then
		if [ ! -f $ENTRY/.git/no_updates ]; then
			cd $ENTRY 
                        LASTTAG=`git describe --tags --dirty=*  2> /dev/null`
                        echo -e "\033[32m $ENTRY:\033[0m clean" 
			BRANCH=`git branch | egrep "^\*" | cut -d' ' -f2`
			git reset --hard origin/$BRANCH
                        git gc --quiet
                        git clean -dfx
			cd $PROJECT_DIR
		fi
	fi
done

TIME=`date +%H:%M:%S`
echo "Cleanall finished:$TIME"

