#!/usr/bin/perl -w

@lines = <STDIN>;

foreach $line(@lines){
    my @num = $line =~ /\-?\d+\.?\d*/g;
    if(@num){
        my $max = (sort {$b <=> $a} @num)[0];
        $hash{$line} = $max; 
    }          
}
if(%hash){
    @largest = reverse sort {$hash{$a} <=> $hash{$b}} keys %hash;
    $largest = $hash{$largest[0]};
}else{
    exit 1;
}
foreach $line(@lines){
    my @num = $line =~ /\-?\d+\.?\d*/g;
    if(@num){
        my $max = (sort {$b <=> $a} @num)[0];
        print "$line" if $max == $largest;   
    }
}


