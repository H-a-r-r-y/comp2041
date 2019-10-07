#!/bin/sh

i=0
while test 1 -eq 1
do
    backUpFile=".$1.$i"

    if ! test -e "$backUpFile"
    then 
        cp $1 $backUpFile
        echo "Backup of '$1' saved as '$backUpFile'"
        break
    fi
    i=$((i + 1))
done 
