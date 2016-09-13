#uses sed to do a find and replace from one string to another in readable files
OLDIFS="$IFS"
IFS='
'

FOO=:
BAR=
for FILE in `find . -type f -print`

do 
        
	NEWFILE="$FILE"tmp
	mv "$FILE" "$NEWFILE"  
	sed  "s/${FOO}/$BAR/g" "$NEWFILE" > "$FILE"
	#sed "s/$/*/" "$NEWFILE" > "$FILE"
	
done

find -name '*tmp' -delete  
