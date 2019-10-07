#!/usr/bin/perl -w 


@array = ();
foreach $arg(@ARGV){
    next if isRepeation($arg);
    push @array, $arg;
    print "$arg ";

}
print "\n";
sub isRepeation{
    my ($i) = @_;
    foreach $a(@array){
        if($a eq $i){
            return 1;        
        }
    }
    return 0;
}
