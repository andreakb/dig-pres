#!/bin/bash
#take all tifs and creates jpg with a specified watermark at angle across the page
WATERMARK='Sourced from Archives New Zealand - For research purposes only'
FONTSIZE=100
BACKGROUND='#0000'
COLOR='#0002'


for TIF in *.tif;
do 
     if [ -s $TIF ] ; then
          
          OUTPUT=`echo ${TIF%.*}.jpg | sed "s/PM/AD/"`
	  
	  
	
          
	   convert $TIF -compress JPEG -quality 80 -background "$BACKGROUND" -fill "$COLOR" -gravity center -pointsize $FONTSIZE \
	   -annotate 45x45+20+20 "$WATERMARK" "$OUTPUT"
     fi
done
