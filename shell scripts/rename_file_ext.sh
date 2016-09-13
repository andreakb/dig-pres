#changes a file's extension
EXT='wp'
NEWEXT='txt'

for FILE in *"$EXT"
do 
       	NEWNAME=`echo ${FILE%.*}.$NEWEXT`
        mv "$FILE" "$NEWNAME"
done 
