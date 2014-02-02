#!/bin/sh
#git recursive directories scripts - http://safrm.net/projects/gr-scripts
#author:  Miroslav Safr miroslav.safr@gmail.com


XSLTPROC=/usr/bin/xsltproc
if [ ! -e $MANXSL ]; then
	echo "$XSLTPROC does not exist, exiting.."
	exit 1
fi

MANXSL=/usr/share/xml/docbook/stylesheet/docbook-xsl/manpages/docbook.xsl
if [ ! -e $MANXSL ]; then
	MANXSL=http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
fi

HTMLXSL=/usr/share/xml/docbook/stylesheet/docbook-xsl/html/docbook.xsl
if [ ! -e $MANXSL ]; then
	MANXSL=http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl
fi

#generate man and html pages
for PAGEXML in $(  find . -type f -name "*8.xml" )
do
	PAGENAME=`basename -s.8.xml $PAGEXML`
	$XSLTPROC -o ./htmlpages/$PAGENAME.html $HTMLXSL $PAGEXML
	$XSLTPROC -o ./manpages/$PAGENAME.8 $MANXSL $PAGEXML
done
