#!/usr/bin/perl -w

open my $file, "<" , "$ARGV[0]" or die;

while ($line = <$file>){
    $line =~ /(\S+)\s+\d+\s+(.+)\s*$/ or die;
    $hash{$2} =  $1; 
}

close($file);

foreach $key(sort keys %hash){
    print "$key $hash{$key}\n";

}
