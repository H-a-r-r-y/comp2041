#!/bin/sh 
#tests for commit remove show commands
#test for forced remove 
legit.pl init 
touch a b c d e f
legit.pl add a b c
legit.pl commit -m "1"
legit.pl rm --force --cached a b 
#test commit after removal 
legit.pl add f
legit.pl commit -a -m "2"
echo something >>a
legit.pl add a
legit.pl commit -m "3"
legit.pl show 0:a
legit.pl show 2:a
echo something > b
legit.pl rm --force b 
legit.pl rm a
legit.pl add a 
legit.pl commit -a -m "4"
legit.pl show 3:a

