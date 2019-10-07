#!/usr/bin/perl -w 

@input_text_array = <>;
$input_text_array = join "", @input_text_array;

@numbers = split(/\D+/, $input_text_array);
print join(",", @numbers), "\n";

foreach $number (@numbers) {
    if ($number ne '') {
        $total += $number;
        $n++;
    }
}

if (@numbers) {
    printf "$n numbers: total $total mean %s\n", $total/$n;
}
