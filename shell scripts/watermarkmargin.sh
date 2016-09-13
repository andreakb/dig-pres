#!/bin/bash
#take all tifs and creates jpg with a specified watermark on the margin
WATERMARK='Sourced from Archives New Zealand - For research purposes only'
FONTSIZE=100
BACKGROUND='#0000'
COLOR='#0015'


for TIF in *.tif;
do 
     if [ -s $TIF ] ; then
          
          OUTPUT=`echo ${TIF%.*}.jpg | sed "s/PM/AD_margin/"`
	  
	  
	
          
	   convert $TIF -compress JPEG -quality 80 -rotate 270 -background "$BACKGROUND" -fill "$COLOR" -gravity south -pointsize $FONTSIZE \
	   -annotate +0+20 "$WATERMARK" -rotate 90 "$OUTPUT"
     fi
done
