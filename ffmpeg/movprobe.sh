#!/bin/bash

for name in *.*; do
        
	ffprobe 2>/dev/null -show_format -show_streams -show_error -export_xmp 1 "$name"  > "${name%.*}_${name#*.}.txt"
        
done 

