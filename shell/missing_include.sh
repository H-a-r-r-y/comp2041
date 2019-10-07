#!/bin/sh 

for file in "$@"
do
    for include_File in `egrep '^#include *"' "$file"| cut -d"\"" -f2`   
    do 
        if test ! -e "$include_File"
        then 
            echo "$include_File included into $file does not exist"
        fi
    done
done
