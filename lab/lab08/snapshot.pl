#!/usr/bin/perl -w

use File::Copy;

sub dirCreation{
    my $i = 0;
    while(1){      
        $dir = ".snapshot.$i";
        if(! -d $dir){
            mkdir $dir or die "cannot make a directory";
            print "Creating snapshot $i\n";
            last;
        }
        $i += 1;
    }
    return $dir;
}

sub saveFunc{
    my $dir = dirCreation();
    my @files = grep { !/^snapshot\.pl$/ } glob("*.*");
    foreach $file(@files){
        copy($file, $dir);
    }
}

sub loadFunc{
    my ($n) = @_;
    saveFunc();
    my @files = glob "\.snapshot\.$n/*.*";
    foreach $file (@files){
        @array = split /\//, $file;
        copy(".snapshot.$ARGV[1]/$array[1]","$array[1]") or die;        
    }
    print "Restoring snapshot $ARGV[1]\n";
}

saveFunc() if $ARGV[0] eq "save";
loadFunc($ARGV[1]) if $ARGV[0] eq "load";
