#!/usr/bin/perl



$string = "heabcefd1sa";
print "$string\n";
$string =~ /abc/;
print "$string\n";

if($string =~ /\d/){
	print "gotcha\n";

}



print"next test\n";

$s = "abcde=2";
$s =~ s/^([a-zA-Z]+)/\$$1/;
print "$s\n";


