#!/usr/bin/perl -w

@lines = <STDIN>;
foreach $line(@lines){
    @a = $line =~ /[0-9]+/g;
    print "@a\n";
}
