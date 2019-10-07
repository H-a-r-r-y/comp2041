#!/usr/bin/perl -w 

open my $file, '>', $ARGV[2] or die "catnot open\n";

$i = $ARGV[0];
$j = $ARGV[1];


while($i <= $j){
    print $file "$i\n";
    $i += 1;

}

close $file;
