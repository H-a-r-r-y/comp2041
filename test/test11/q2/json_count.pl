#!/usr/bin/perl -w

open my $file, "<", "$ARGV[1]" or die "fail to open";
my @lines = <$file>;

my $sum = 0;
for($i=0;$i<=$#lines;$i++){
    if($lines[$i] =~ $ARGV[0]){
        $lines[$i-1] =~ /(\d+)/ or die;
        $sum += $1;
    }
}
print "$sum\n";
