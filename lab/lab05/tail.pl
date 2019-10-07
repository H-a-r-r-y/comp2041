#!/usr/bin/perl -w

#handle command line files
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
    # handle other options
    } elsif ($arg =~ /^-[0-9]+$/) {
    	$arg =~ s/-//;
    	$n = $arg;
    } else {
        push @files, $arg;
    }
}

#open each file
foreach $file (@files) {
    open F, "<", "$file" or die "$0: Can't open $file: $!\n";
    $n = 10 if ! defined $n; 
    $lineNum = 0;
	while($line = <F>){
		$lineNum += 1;
		push @lines, $line;
	}
	#display files seperately if more than one files
	if(@files > 1){
		print "==> $file <==\n";
	}
	$start = @lines - $n;

	if($lineNum < $n){
		print "A one line file.\n";
	}else{
		while($start < @lines){
			print "$lines[$start]";
			$start += 1;		
		}
	}	
    close F;
}

#read from stdin
if (@files == 0){
	@lines = <STDIN>;
	$start = @lines - 10;
	while($start < @lines){
		print "$lines[$start]";
		$start ++;
	}
	exit 0;
}

