#!/usr/bin/perl -w



open F, ">>", "$ARGV[2]" or die;

for($i=$ARGV[0];$i<=$ARGV[1];$i+=1){
    print F "$i\n";
}
close(F);
