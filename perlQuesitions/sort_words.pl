#!/usr/bin/perl -w

while(<STDIN>){
    @words = split /\s+/, $_;   
    @sorted_words = sort @words; #sort a array
    print "@sorted_words\n";
}


#sort words on each line of STDIN
