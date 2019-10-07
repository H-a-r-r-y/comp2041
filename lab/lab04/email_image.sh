#!/bin/sh 


for file in "$@"
do
	display $file
	echo "Address to e-mail this image to?"
	read email
	echo "Message to accompany image?"
	read message
	echo "$file sent to $email"
	echo "$message"|mutt -s 'penguins!' -e 'set copy=no' -a $file -- $email
done

