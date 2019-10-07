#!/usr/bin/perl -w

if(@ARGV == 0 or @ARGV > 2 or @ARGV == 1){
	print "Usage: ./echon.pl <number of lines> <string>\n";
	exit 0;
}elsif($ARGV[0] !~ /^[0-9]+$/ or $ARGV[0] < 0){
	print "./echon.pl: argument 1 must be a non-negative integer\n";
	exit 0;
}else{
	$i = 0;
	while($i < $ARGV[0]){
		print "$ARGV[1]\n";
		$i += 1;
	}

}
