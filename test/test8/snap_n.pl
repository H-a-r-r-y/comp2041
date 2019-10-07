#!/usr/bin/perl -w

@a = ();
while($line = <STDIN>){
    push @a, $line;
    if(checkOccurance($ARGV[0],$line)){
        print "Snap: $line";
        exit(1);
    }
}

sub checkOccurance {
    my ($n, $element) = @_;
    $occurance = 0;
    foreach $i(@a){
        if ($i eq $element){
            $occurance += 1;
        }    
    }
    return 1 if $occurance == $n;
    return 0; 
}
