#!/usr/bin/perl -w

while($line = <STDIN>){
    $hash{$line}++;
    print "Snap: $line" and last if $hash{$line} eq $ARGV[0];
}
