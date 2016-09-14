#!/bin/bash

probe () {
	# call ffprobe and log warmings to a text file
	( FFREPORT=file=error.log:level=24 ffprobe -loglevel warning -show_streams -show_format -of flat -i "$file" > probe.txt)

}

check_field (){
  #checks if a field is included the probe output
  field="$(less probe.txt | grep "$1" | wc -l)"

}

check_lines (){
  # checks how many lines are in the ffprobe error log
	lines="$(wc -l  < error.log)"
}

alert () {
  # prints an alert message to a text file 
  echo "$1" >> dodgyfiles.txt
  echo >> dodgyfiles.txt

}


for file in *.*; do

       probe
       
       

       
       check_lines
       a=2
       if [ $lines -gt $a ] ; then 
	      alert "$file has errors or warnings. Check errors.txt for specifics"
        less error.log >> errors.txt 
       fi 	
       a=1
       
       check_field 'codec_type="video"'
       if [ $field -lt $a ] ; then 
        alert "$file has no video streams"
      fi
       
       check_field 'codec_type="audio"'
       if [ $field -lt $a ] ; then 
        alert "$file has no audio streams" 
       fi 

done 

