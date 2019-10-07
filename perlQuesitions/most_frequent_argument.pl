#!/usr/bin/perl -w

foreach $arg(@ARGV){
    $hash{$arg}++;
}

@most = sort {$hash{$b} <=> $hash{$a}} keys %hash;
$most = $hash{$most[0]};

foreach $arg(@ARGV){
    if ($hash{$arg} == $most){
        print "$arg\n";
        last;
    }
}


