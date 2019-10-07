#!/bin/sh 

for file in *.htm
do
    temp=`echo "$file" | sed "s/htm/html/"`
    if test -e "$temp"
    then 
        echo "$temp" exists
        exit 1
    else
        cp "$file" "$temp"
        rm "$file"
    fi 
done


#test run by 2041 autotest htm2html
