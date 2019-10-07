#!/usr/bin/perl -w 

$sum = 0;
while($line = <>){
    my @words = split /[^a-zA-Z]+/, $line;
    $num = @words;
    foreach $ele (@words){
        if($ele =~ /^$/){
            $num -= 1;
        }
    } 
    $sum += $num;
}

print "$sum words\n";
