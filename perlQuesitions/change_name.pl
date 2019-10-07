#!/usr/bin/perl -w

while($line = <STDIN>){
    @part = split /\|/, $line;
    $part[2] =~ /(.*), (.*)/;
    $name = "$2 $1";
    $line =~ s/$part[2]/$name/;
    print "$line"
}
