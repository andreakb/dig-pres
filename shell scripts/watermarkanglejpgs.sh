#!/bin/bash
#take all tifs in a directory structure and creates jpg with a specified watermark at angle across the page
OLDIFS="$IFS"
IFS='
'
TOPDIR='R*'
DIRNAME='DC'
OLDDIR="Master"
WATERMARK='Sourced from Archives New Zealand - For research purposes only'
FONTSIZE=100
BACKGROUND='#0000'
COLOR='#0003'
for DIR in `find -type d -name "$TOPDIR" -print`;
do
	
	mkdir -p "$DIR/$DIRNAME"
done

for TIF in `find . -name "*.tif" -print`
do 
 
     	if [ -s $TIF ] ; then
         
         	OUTPUT=`echo ${TIF%.*}.jpg | sed "s/${OLDDIR}/$DIRNAME/;s/PM/AD/"`
		
	  
	  
	
          
		convert $TIF -compress JPEG -quality 80 -background "$BACKGROUND" -fill "$COLOR" -gravity center -pointsize $FONTSIZE \
        	-annotate 45x45+20+20 "$WATERMARK" "$OUTPUT"
     	fi
	
done
