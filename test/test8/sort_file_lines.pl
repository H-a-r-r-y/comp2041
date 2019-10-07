#!/usr/bin/perl -w

while($line = <>){
    chomp $line;
    $hash{$line} = length($line);
}

foreach $key(sort { $hash{$a} <=> $hash{$b} || $a cmp $b  } keys %hash){
    print "$key\n";
}





