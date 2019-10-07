#!/usr/bin/perl -w

open F, "fines.txt" or die;

while ($line = <F>){
	$line =~ /\$([0-9]+)/ or die;
	print "$1\n";

}


while ($line = <F>){
	$line =~ /\$(\d+)/;
	$fine = $1;
	$line =~ /"([^"]*)/;
	$name = $1;
	print $name;
	
	$fine_total{$name} += $fine;
}
print $fines_total {"Weilin Wu"}, "\n";

$worst = 0;
for $student (key %fines_total){
	if($fines_total{$student} > $worst){
		$worst = $fine_total{$student};
		$worst_student = $student;
	
	}
}

open F, "|", "date" or die;
##treat date as program, run date
$date = <F>;
print $date;
