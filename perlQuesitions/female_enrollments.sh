#!/bin/sh 

egrep "F" | cut -d"|" -f2 | sort | uniq
