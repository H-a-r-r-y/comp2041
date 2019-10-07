#!/usr/bin/perl -w

open F, "<", "$ARGV[0]" or die;

@lines = <F>;

foreach $line(@lines){
    $hash{$line} = length($line);
}

foreach $key(sort {$hash{$a} <=> $hash{$b} || $a cmp $b } keys %hash){
    print "$key";
}
