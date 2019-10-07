#!/usr/bin/perl -w

while($line = <STDIN>){
    @num = $line =~ /(\d+(?:\.\d+)?)/g;
    foreach $n(@num){
        $round = int($n + 0.5);
        $line =~ s/$n/$round/;
    }
    print "$line"
}
