#!/usr/bin/perl -w 

foreach $arg(@ARGV){
    if($arg =~ /[aeiou][aeiou][aeiou]/i){
        print "$arg ";
    }
}
print "\n";
