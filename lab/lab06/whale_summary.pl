#!/usr/bin/perl -w 

open F, '<', "$ARGV[0]" or die "$0 cannot open the file: $!";
while ($line = <F>){
	chomp $line;
	$line = lc $line;
    $line =~ s/ +/ /g;
    #$line =~ s/\s+/\s/g;
    $line =~ s/s$//g;
    $line =~ s/\s$//;
    $line =~ /\s(\d+)\s(.*)/;
    $whale = $2;
    if (defined $whalePod{$whale} and defined $whaleNum{$whale}){
        $whalePod{$whale} += 1;
        $whaleNum{$whale} += $1;      
    }else{
        $whalePod{$whale} = 1;
        $whaleNum{$whale} = $1;
    }		
    
  
}


foreach $whale (sort keys %whalePod){
	print "$whale observations: $whalePod{$whale} pods, $whaleNum{$whale} individuals\n";
}
