#!/usr/bin/perl -w

open F, "<", "$ARGV[0]" or die;

$num = 0;
while(my $line = <F>){
    $line =~ /\S+\s+(\d+)\s(.+)\s+$/ or die;
    if($2 eq "Orca"){
        $num += $1;
    }
}

print "$num Orcas reported in $ARGV[0]\n";
