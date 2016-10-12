#!/bin/bash
MAINDIR='Finished'
OLDPREFIX='PM_'
NEWPREFIX=''
SUBFOLDER='Master'
# for splitting multipage tifs in single tifs in folders appropriate for ingest through ANZ's ingestor tool and Jan's filenaming requirments. Places all split tifs 
#into a sub directories for each multipage tif under a new main directory

mkdir "$MAINDIR"
for TIF in *.tif; do
        #creates a name for a directory based on the tif's filename and eliminates spaces. 
	DIR=`echo ${TIF%.*} | sed "s/^${OLDPREFIX}/$NEWPREFIX/g;s/ /_/g"`
	
	mkdir -p "$MAINDIR"/"$DIR"
	mkdir -p "$MAINDIR"/"$DIR"/"$SUBFOLDER"
	tiffsplit "$TIF" "$MAINDIR/$DIR/$SUBFOLDER/"
	cd "$MAINDIR/$DIR/$SUBFOLDER/"
        # edits the newly split tifs filenames from being the lettered output of tiffsplit ie aaa.tif aab.tif aac.tif etc to numbers ie 001.tif 002.tif 003.tif	
	find -name '*.tif'| awk 'BEGIN{ a=001 }{ printf "mv \"%s\" %04d.tif\n", $0, a++ }' | bash
	# edits filenames again to add the filename of the original multipage tif to all the split tiffs
        for SPLIT in *.tif; do
		
		NEWTIF=`echo "$SPLIT" | sed -e "s/^/${DIR}_/g;s/^${NEWPREFIX}/$OLDPREFIX/g"`
		
		mv "$SPLIT" "$NEWTIF"
	done
		
	cd ../../..

	
done

