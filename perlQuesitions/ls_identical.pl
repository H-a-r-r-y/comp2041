#!/usr/bin/perl -w

use File::Compare;

@files = glob("$ARGV[0]/*");

for $file(@files){
    $file =~ /.*\/(.*)/;
    if (-e "$ARGV[1]/$1" and ! compare($file, "$ARGV[1]/$1")){
        print "$1\n";
    }
}
