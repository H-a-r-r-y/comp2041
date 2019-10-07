#!/bin/sh 


#for enrollment.txt 

egrep 'COMP[29]041' "$1"|
cut -d"|" -f3| 
cut -d"," -f2 |
cut -d" "  -f2|
sort |
uniq -c |
sort |
tail -n 1 |
sed "s/.* //" 





