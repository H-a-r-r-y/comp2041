#!/usr/bin/perl -w

$time = 0;
while ($line = <STDIN>){
    $line = lc $line;
    @words = $line =~ /[a-zA-Z]+/g; #regex => array
    foreach $word (@words){
        $time += 1 if $word eq "$ARGV[0]";
    }
}
print "$ARGV[0] occurred $time times\n";



#count the number of times a specific word found in standard input 

