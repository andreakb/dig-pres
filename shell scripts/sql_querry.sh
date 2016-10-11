#!/bin/bash
#for editing lists of values to an appropriate form for querring in sql, ie R10918185 becomes "R10918185", and so on
#command requires sql_querry.sh <input> prints to STDOUT

#create a temp file to get rid of new lines
tr -d '\015' < "$1" > noreturnstemp

while read NUMBER
do


echo "'$NUMBER'," 	

done < "noreturnstemp" 
rm noreturnstemp
