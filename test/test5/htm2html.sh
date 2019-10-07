#!/bin/sh

for file in *.htm
do 
	file2=`echo "$file" | sed "s/htm/html/" `
	for temp in *.html
	do
		if test "$file2" == "$temp"
		then
			echo "$file2 exists"
			exit 1
		fi
	done
	mv "$file" "$file2"

done

































