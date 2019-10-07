#!/bin/sh
regex="#include \".*\""

for arg in "$@" 
do 
	while read line 
	do
		if [[ $line =~ $regex ]]
		then 
			headfile=`echo "$line" | cut -d'"' -f2`
			if ! test -e $headfile 
			then 
				echo "$headfile included into $arg does not exist" 
			fi
			 
		fi
	done < "$arg"
done
