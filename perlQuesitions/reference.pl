#!/usr/bin/perl -w


@lines = <STDIN>;

for $line(@lines){
    if($line =~ /^#(\d+)/){
        $line = $lines[$1-1];
    }
    print "$line";
}
