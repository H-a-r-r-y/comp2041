#!/usr/bin/perl -w 

use File::Compare;

my @files1 = glob "$ARGV[0]/*";
my @files2 = glob "$ARGV[1]/*";
my @iFiles = ();
for(my $i = 0; $i < @files1; $i += 1){
    $files1[$i] =~ /\/(.*)/ or die;
    $files1[$i] = $1;
}
for(my $i = 0; $i < @files2; $i += 1){
    $files2[$i] =~ /\/(.*)/ or die;
    $files2[$i] = $1;
}

foreach my $file(@files1){
    next if ! -e "$ARGV[1]/$file";
    push @iFiles, $file if ! compare("$ARGV[1]/$file", "$ARGV[0]/$file");
}

@iFiles = sort{ $a cmp $b } @iFiles;


foreach my $file(@iFiles){
    print "$file\n";

}

