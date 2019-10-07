#!/bin/sh

for file in *.jpg
do 
	temp=`echo "$file" | cut -d'.' -f1`
	temp2="$temp.png"
	for file2 in *.png
	do
		if test "$file2" = "$temp2"
		then
			echo "$temp2 already exists"
		else
			convert "$temp.jpg" "$temp.png"
		fi
	done
	
done
