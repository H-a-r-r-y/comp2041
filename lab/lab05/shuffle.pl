#!/usr/bin/perl -w

@lines = <>;

for ($i=0;$i<@lines;$i++){
	$index = rand(100) % @lines;
	$index2 = rand(100) % @lines; 
	$temp = $lines[$index];
	$lines[$index] = $lines[$index2];
	$lines[$index2] = $temp;
}

foreach $ele (@lines){
	print"$ele";
}
