#!/usr/bin/perl -w

$sum = 0;
while ($line = <STDIN>){

	$line =~ s/^\s*//; ##remove white space
	$line =~ s/\s*$//; ##remove white space
	
	##check if it is a number
	if ($line !~ /^\d[.\d]*$/){
		die "this is not a number\n";
	}
	$sum = $sum + $line; 
	
}

print "sum is $sum\n";
