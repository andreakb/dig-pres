#!/bin/bash

probe () {
	
	( FFREPORT=file=error.log:level=24 ffprobe -loglevel warning -show_streams -show_format -of flat -i "$file" ; echo "status=$?")

}



check_lines (){
	lines="$(wc -l  < error.log)"
}
for file in *.*; do

       probe
       check_lines
       a=2
       if [ $lines -gt $a ] ; then 
	echo "GREATER THAN TWO"
        less error.log >> errors.txt 
       fi 		 	

done 

