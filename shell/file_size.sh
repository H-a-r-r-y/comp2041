#!/bin/sh

#classify the files in current dir into small (#lines < 10), medium, (10 < #lines <100) or large (#lines > 100)

small="Small files:"
medium="Medium-sized files:"
large="Large files:"

for file in *
do
    num=`wc -l <$file`
    if test $num -lt 10
    then 
        small="$small $file"
    elif test $num -lt 100
    then 
        medium="$medium $file"
    else
        large="$large $file"
    fi
done

echo $small
echo $medium
echo $large

