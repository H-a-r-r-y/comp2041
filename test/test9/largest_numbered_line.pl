#!/usr/bin/perl -w

@lines = <STDIN>;
foreach $line(@lines){
    @numbers = $line =~ /-?\d+\.?\d*/g;
    $i = $numbers[0];
    foreach $num(@numbers){
        $i = $num if $i < $num;
    }
    $hash{$line} = $i if defined $i;
}


foreach $key(reverse sort {$hash{$a} <=> $hash{$b}} keys %hash){
    $largestKey = $key;
    $largestVal = $hash{$key};
    last;
}
foreach $key(keys %hash){
    $largestKey = $key unless defined $largestKey;
    $largestVal = $hash{$key} unless defined $largestVal;
    if($hash{$key} == $largestVal){
        $largest{$key} = $largestVal;
    }
}

foreach $key(keys %largest){
    print "$key";
}


