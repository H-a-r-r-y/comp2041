#!/usr/bin/perl -w

#Write a Perl script digits.pl that reads from standard input and writes to standard output mapping all digit characters whose #values are less than 5 into the character '<' and all digit characters whose values are greater than 5 into the character '>'. #The digit character '5' should be left unchanged.


while($line = <>){
    $line =~ s/[01234]/</g;
    $line =~ s/[6789]/>/g;
    print "$line";
}
