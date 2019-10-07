#!/bin/sh 

for file in $1/*
do
    file=`echo "$file" | sed 's/.*\///'`
    if test -e "$2/$file"
    then 
        if diff "$2/$file" "$1/$file" >/dev/null
        then 
            echo "$file"
        fi
    fi
done


