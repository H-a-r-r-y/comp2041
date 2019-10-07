#!/usr/bin/perl -w 

foreach $arg (@ARGV){
	open my $f, '<', "$arg" or die "$0: can not open: $!"; 
	while($line = <$f>){
		if($line =~ /Orca/){
			push @orca, $line;
		}
	}

	$sum = 0;
	foreach $line (@orca){
		$line =~ /\s(\d+)\s/ or die "match fail";
		$sum += $1;
	}

	print "$sum Orcas reported in $arg\n"
}

