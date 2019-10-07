#!/usr/bin/perl -w

$suffix = 0;
while(-e ".$ARGV[0].$suffix"){  #use while loop check if a file exist
    $suffix += 1;
}

open OUT, ">", ".$ARGV[0].$suffix" or die;
open IN, "<", "$ARGV[0]" or die;

while(<IN>){
    print OUT $_;
}

print "Backup of '$ARGV[0]' saved as '.$ARGV[0].$suffix'\n";
close(IN);
close(OUT);
