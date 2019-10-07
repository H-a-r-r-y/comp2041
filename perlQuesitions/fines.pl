#!/usr/bin/perl -w

while($line = <STDIN>){
    $line =~ /(.*)\s(\d+)/;
    $hash{$1} += $2;
}

foreach $key(sort { $hash{$b} <=> $hash{$a} } keys %hash){
    print"Expel $key whose library fines total \$$hash{$key}\n";
    last;
}

