#!/usr/bin/perl -w


$count = 0;
while(my $line = <STDIN>){
    $line = lc $line;
    my @a = $line =~ /[a-zA-Z]+/g;

    foreach $ele(@a){
        if($ele =~ /^$ARGV[0]$/){
            $count += 1;
        }
    }
}

print "$ARGV[0] occurred $count times\n";
