#!/bin/sh

file=$1
i=0
while test -e ".$file.$i" 
do
    i=$(($i + 1))
done

touch ".$file.$i"
cp "$file" ".$file.$i"
echo "Backup of '$file' saved as '.$file.$i'"
