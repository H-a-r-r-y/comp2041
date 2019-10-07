#!/usr/bin/perl -w 
open IN, "<", "$ARGV[0]" or die "cant not open shell file";
@lines = <IN>;
print "#!/usr/bin/perl -w\n";
foreach $line(@lines){
    #
    if($line =~ /#!\/bin\/bash/){
    #does nothing 
    }elsif($line =~ /^#/){
        print "$line";
    }elsif($line =~ /(while.*|if.*)/){
        chomp $line;
        $line =~ s/([a-zA-Z]+)/\$$1/g;
        $line =~ s/\$while/while/;
        $line =~ s/\$if/if/;
        $line =~ s/\(\(/\(/;
        $line =~ s/\)\)/\)/;
        print "$line\{\n"; 
    }elsif($line =~ /(\s*)(done|fi$)/){
        print "$1}\n";
    }elsif($line =~ /(do|then)/){   
    #does nothing
    }elsif($line =~ /(\s*)else/){
        print "$1}else{";
    }elsif($line =~ /(\s*)echo.*/){
        $line =~ s/echo */print "/g;
        $line =~ s/\n/\\n";\n/g;
        print $line;
	}elsif($line =~ /^$/){
        print "$line";
    }else{
        chomp $line;
        $line =~ s/\(\(//g;
        $line =~ s/\)\)//g;
        $line =~ s/\$//g;
        $line =~ s/([a-zA-Z]+)/\$$1/g;
        print "$line;\n";
    }
}
    

