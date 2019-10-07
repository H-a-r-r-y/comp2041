#!/usr/bin/perl -w


open my $f, '<', "$ARGV[1]" or die "$0: can not open: $!"; 
while($line = <$f>){
	if($line =~ /$ARGV[0]/){
		push @array, $line;
	}
}

$sum = 0;
foreach $line (@array){
	$line =~ /\s(\d+)\s/ or die "match fail";
	$sum += $1;
}
$pod = @array;
print "$ARGV[0] observations: $pod pods, $sum individuals\n"



