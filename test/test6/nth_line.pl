#!/usr/bin/perl -w

open my $file, "<", $ARGV[1] or die "can not open $ARGV[1]\n";
$i = 1;
while($line = <$file>){
    if($i == $ARGV[0]){
        print "$line";
    }
    $i += 1;
} 
