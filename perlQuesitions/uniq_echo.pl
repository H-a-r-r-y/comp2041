#!/usr/bin/perl -w

@array = ();
foreach $arg(@ARGV){
   push @array, $arg if ! exist($arg);    
}

sub exist{
    my ($i) = @_;
    foreach $element(@array){
        return 1 if $i eq $element;
    }
    return 0;
}

print "@array\n";
