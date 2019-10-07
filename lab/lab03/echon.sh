#!/bin/sh 


if test $# -ge 3 || test $# -eq 0
then
	echo "Usage: ./echon.sh <number of lines> <string>" 
	exit 1
fi
if echo "$1" | egrep '^[0-9]+$' >/dev/null
then
	if test $1 -lt 0
	then
		echo "./echon.sh: argument 1 must be a non-negative integer"
		exit 1
	else
		a=0
		while test $a -lt $1 
		do 
			echo "$2" 
			a=$((a + 1))
		done 
	fi
else
	echo "./echon.sh: argument 1 must be a non-negative integer"
fi 
