#!/usr/bin/perl -w

while ($line = <>) {
    @fields = split /\|/, $line;
    $course = $fields[0];
    $full_name = $fields[2];
    $full_name =~ /.*,\s+(\S+)/ or next;
    $first_name = $1;
    $cfn{$course}{$first_name}++;
}

while($line = <>){
    $line =~ /(.*)\|.*\|.*,\s(.+)/ or die"here\n";
    $course = $1;
    $first_name = $2;
    $cfn{$course}{$first_name}++;
}

foreach $course (sort keys %cfn) {
    foreach $first_name (sort keys %{$cfn{$course}}) {
        next if $cfn{$course}{$first_name} < 2;
        printf "In $course there are %d people with the first name $first_name\n", $cfn{$course}{$first_name};
    }
}


































