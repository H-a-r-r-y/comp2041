#!/usr/bin/perl -w

use File::Compare;

print "Usage: ./identical_files.pl <files>\n" and exit 1 if @ARGV == 0 or @ARGV == 1;

for($i=0; $i<$#ARGV; $i+=1){
    if(compare($ARGV[$i], $ARGV[$i+1])){
        print "$ARGV[$i+1] is not identical\n";
        exit 1;
    }
}
print "All files are identical\n";
