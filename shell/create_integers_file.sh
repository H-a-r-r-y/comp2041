#!/bin/sh 

: '''
Write a Shell program, create_integers_file.sh which takes 3 arguments.
The first & second arguments will specify a range of integers.

The third argument will specify a filename.

Your program should create a file of this name containing the specified integers.

'''
touch $3

i=$1
while test $i -le $2
do
    echo $i >>$3
    i=$(($i + 1))
done


#2041 autotest shell_create_integers_file
