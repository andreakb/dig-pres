#edits the begining of a file's name
OLDIFS="$IFS"
IFS='
'
OLDPREFIX='access'
NEWPREFIX='R'
for FILE in "$OLDPREFIX"*
do 
        
       NEWNAME=`echo "$FILE" | sed -e "s/^${OLDPREFIX}/$NEWPREFIX/"`
       
       
       mv "$FILE" "$NEWNAME"
done 
