#!/bin/bash

probe () {
	
	( FFREPORT=file=error.log:level=24 ffprobe -loglevel warning -show_streams -show_format -of flat -i "$file")

}



check_lines (){
	lines="$(wc -l  < error.log)"
}

bad () {
  echo "$1" >> dodgyfiles.txt

}
for file in *.*; do

       probe
       check_lines
       a=2
       if [ $lines -gt $a ] ; then 
	      bad "$file has errors or warnings. Check errors.txt for specifics"
        less error.log >> errors.txt 
       fi 		 	

done 

