#!/bin/bash

for file in *.*; do
        
       FFREPORT=file=error.log:level=24 ffprobe -loglevel warning "$file"  
        less error.log >> errors.txt 
      
done 

