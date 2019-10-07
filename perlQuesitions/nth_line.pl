#!/usr/bin/perl -w

open F, "<", "$ARGV[1]" or die;
@lines = <F>;
print "$lines[$ARGV[0]-1]" if defined $lines[$ARGV[0]-1]; 

