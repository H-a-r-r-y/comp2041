#!/usr/bin/perl -w

$num = 0;
while($line = <STDIN>){
    @words = $line =~ /[a-zA-Z]+/g;
    $num += @words;
}
print "$num words\n";


#count the number of words in standard input
