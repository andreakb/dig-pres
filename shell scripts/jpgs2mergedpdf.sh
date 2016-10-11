#!/bin/bash
# create a merged pdf from jpgs using imagemagcik and ghostscript

#Directory name prefix to get rid of to name output pdf
OLDPREFIX='.\/Batch__'

#recurse through directories

for DIR in `find -type d -print`
do 
	

#create a tmp file in each director
if [ ! -d "$DIR"/tmp ] ; then
	
	mkdir "$DIR"/tmp ;
fi

# create pdfs with imagemagick for each jpg in a folder

j=`find $DIR -maxdepth 1 -name '*.jpg' | wc -l`

	for (( i=1;$i<$j+1;i=$i+1 ))

	do

		printf -v num '%04d' $i;
		

		find $DIR -name "*$num.jpg" -exec convert -compress jpeg {} "$DIR/tmp/$num.pdf" \;
	
	done
#merge pdfs into a single file using ghostscript

k=`ls -1 "$DIR"/tmp |wc -l`
OUTPUT_FILE=`echo "$DIR" | sed -e "s/^${OLDPREFIX}//"`
if [ $k -gt 0 ] ; then
	
	 
	echo "$DIR"/tmp
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$DIR/$OUTPUT_FILE".pdf "$DIR"/tmp/*.pdf
 	
fi
rm -r "$DIR"/tmp
 
done
