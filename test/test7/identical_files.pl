#!/usr/bin/perl -w

print "Usage: ./identical_files.pl <files>" if @ARGV == 0;
use File::Compare;
for($i=0; $i<@ARGV-1; $i++){
    if(compare("$ARGV[$i]","$ARGV[$i+1]")){
        print("$ARGV[$i+1] is not identical\n");
        exit(1);
    }
}
print "All files are identical\n";

