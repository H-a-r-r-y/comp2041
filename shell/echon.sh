#!/bin/sh

#Write a shell script called echon.sh which given exactly two arguments, an integer n and a string, prints the string n times



i=0

while test $i -lt $1
do
    echo $2
    i=$(($i + 1))
done
