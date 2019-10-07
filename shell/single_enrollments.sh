#!/bin/sh

cut -d"|" -f2 | sort | uniq -c | egrep "^\s+1\s" | sed 's/.* //'
