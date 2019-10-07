#!/bin/sh 

##test for legit add functionality 
legit.pl init 

## filename validation
touch Q#5%ddfa
legit.pl add Q#5%ddfa
touch *4#@d2
legit.pl add *4#@d2

## file doesnot exist
legit.pl add non-exist

## file been removed
touch a
legit.pl add a
rm a
legit.pl add a

