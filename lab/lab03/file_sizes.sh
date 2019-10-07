#!/bin/sh

small="Small files:"
medium="Medium-sized files:"
large="Large files:"
 
for file in *
do 
	line=`wc -l < $file`
	if test $line -lt 10
	then
		small="$small $file"
	elif test $line -lt 100
	then
		medium="$medium $file"
	else
		large="$large $file"
	fi	   
done
echo $small
echo $medium
echo $large

































