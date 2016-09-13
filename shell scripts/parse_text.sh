#!/bin/bash
#for searching and identify files with a string
#command requires parse_text.sh <string> outputs to STDOUT
STRING="$1"
OLDIFS="$IFS"
IFS='
'

for FILE in `find . -type f -print`

do

	MATCH=`echo | 2>/dev/null less "$FILE" | grep "${STRING}" | wc -l`
	
	if [ $MATCH -gt 0 ] ; then
		echo "$FILE"
	fi
	
done
