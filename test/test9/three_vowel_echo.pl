#!/usr/bin/perl -w


foreach $arg(@ARGV){
    print "$arg " if $arg =~ /[aeiouAEIOU][aeiouAEIOU][aeiouAEIOU]/;
}
print "\n";
