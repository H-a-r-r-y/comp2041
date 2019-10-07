#!/usr/bin/perl -w 

open F, "<", "$ARGV[0]" or die "failed to open";

$i=0;
while(1){  
    $file = ".$ARGV[0].$i";
    if(! -e $file){
        last;
    }   
    $i += 1;
}

open W, ">", "$file" or die "failed to open";

while($line = <F>){
    print W $line;
}
print "Backup of '$ARGV[0]' saved as '$file'\n";
close(W);
close(F);
