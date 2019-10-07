#!/usr/bin/perl -w


while($line = <>){
    chomp $line;
    @words = split /\s+/, $line;
    @new = sort @words;
    print "@new\n";
}

