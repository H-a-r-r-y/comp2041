#!/usr/bin/perl -w 

open F, "<", "$ARGV[0]" or die;

while($line = <F>){
    if($line =~ /$ARGV[1]/){
        $line =~ s/$ARGV[1]/\($ARGV[1]\)/g;
        print "$line";
    }

}

