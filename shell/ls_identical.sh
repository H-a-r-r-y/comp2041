#!/bin/sh

for file1 in $1/*
do
    file1=`echo "$file1" | sed 's/.*\///'`
    if test -e "$2/$file1"
    then
        if diff "$1/$file1" "$2/$file1" > /dev/null
        then 
            echo "$file1"
        fi
    fi
done 
