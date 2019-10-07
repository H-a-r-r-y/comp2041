#!/usr/bin/perl -w

open R, '<', $ARGV[0] or die "fail to open";
while($line = <R>){
    $line =~ s/\d/#/g;
    push @array, $line;    
}
close(R);

open F, '>', $ARGV[0] or die "fail to open";
foreach $ele(@array){
    print F $ele;
}
close(F);
