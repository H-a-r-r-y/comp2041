#!/usr/bin/perl -w 
open IN, "<", "$ARGV[0]" or die;
@lines = <IN>;
for($i=0; $i<@lines; $i+=1){
    $lines[$i] =~ s/[0-9]/#/g;
}
close(IN);
open OUT, ">", "$ARGV[0]" or die;
foreach my $line(@lines){
    print OUT $line;
}
close(OUT);
