#!/usr/bin/perl -w 

use File::Copy;
use File::Compare;

#call those functions
init() if $ARGV[0] eq "init"; 
add() if $ARGV[0] eq "add";
commit() if $ARGV[0] eq "commit";
legitLog() if $ARGV[0] eq "log"; 
show() if $ARGV[0] eq "show";
remove() if $ARGV[0] eq "rm";
status() if $ARGV[0] eq "status";

sub init{
    #if .legit already existed, exit program
    if(-d ".legit"){
        print "legit.pl: error: .legit already exists\n";
        exit(1);
    }else{
        mkdir ".legit" or die "cannot make a new directory called .legit";
        print "Initialized empty legit repository in .legit\n";
    }
    #initialise a commit file
    mkdir ".legit/commit" or die "failed to make commit directory";
    open my $file, ">", ".legit/commit/message" or die "cant create message file";
    close($file);
}

sub add{
    if(! -d ".legit"){
        print "legit.pl: error: no .legit directory containing legit repository exists\n";
        exit(1);
    } 
    mkdir ".legit/index" unless -d ".legit/index";
    #save inputed files if files given 
    my ($file) = @_;
    if(defined $file){
        copy($file,".legit/index");
    }else{
        #save files form command line argument
        foreach $arg(@ARGV){
            next if $arg eq "add";
            if($arg =~ /[^a-zA-Z0-9-_.]/){
                print "legit.pl: error: invalid filename '$arg'\n";
            }elsif(! -e $arg and ! -e ".legit/index/$arg"){
                print "legit.pl: error: can not open '$arg'\n";
            }elsif(! -e $arg and -e ".legit/index/$arg"){
                unlink ".legit/index/$arg";
            }else{
                copy($arg,".legit/index");
            }
        }
    }
}

sub commit{
    my @files = glob ".legit/index/*";
    foreach my $file(@files){
        $file =~ /\/.*\/(.*)/ or die;
        if($ARGV[1] eq "-a"){
            add($1) if -e "$1" and compare($1, $file); 
        }
        $flag = 0 if -e ".legit/$1" and compare($file, ".legit/$1");      
        $flag = 0 if ! -e ".legit/$1";     
    }
    #update if file in index was removed
    foreach my $file(glob ".legit/*"){
        $file =~ /\/(.*)/ or die;
        next if $1 =~ /(index|commit)/;
        unlink "$file" and $flag = 0 if ! -e ".legit/index/$1"; 
    }
    #exit if nothing to commit 
    print "nothing to commit\n" and exit(1) if ! defined $flag; 
    #get the times of commit
    open my $f, "<", ".legit/commit/message" or die "cant open commitNum file";
    @messages = <$f>;
    if(@messages == 0){
        $newCommit = 0;
    }else{ 
        $messages[$#messages] =~ /(\d+).*/ or die;
        $newCommit = $1 + 1;
    }
    close($f);
    #save the message and save files to repository
    open my $f1, ">>", ".legit/commit/message" or die "cant open commit file";
    print $f1 "$newCommit $ARGV[2]\n" if $ARGV[2] ne "-m";
    print $f1 "$newCommit $ARGV[3]\n" if $ARGV[2] eq "-m"; 
    close($f1);
    mkdir ".legit/commit/commit.$newCommit" or die "cant make directory";
    print "Committed as commit $newCommit\n";
    foreach my $file(@files){
        copy($file, ".legit/commit/commit.$newCommit");
        copy($file, ".legit");  
    }   
}  


sub legitLog{
    my @nfiles = glob ".legit/commit/*";
    print "legit.pl: error: your repository does not have any commits yet\n" and exit(1) if @nfiles == 1;
    open my $file, "<", ".legit/commit/message" or die "cant not open commit";
    my @files = <$file>;
    for($i=$#files; $i>=0; $i-=1){
        print "$files[$i]";
    }
    close($file);
}

sub show{
    #error checking
    if(@ARGV != 2){
        print "usage: legit.pl show<commit>:<filename>\n";
        exit(1);
    } 
    
    #if commit is specified, get the specified contents
    if($ARGV[1] =~ /(.+):(.*)/){
        if(! -e ".legit/commit/commit.$1"){ 
            print "legit.pl: error: unknown commit '$1'", "\n";  
            exit(1);      
        }
        if(! -e ".legit/commit/commit.$1/$2"){
            print "legit.pl: error: '$2' not found in commit $1", "\n";
        }else{
            open my $f, "<", ".legit/commit/commit.$1/$2" or die "failed to open";
            @lines = <$f>;
            foreach my $line(@lines){
                print "$line";
            }
            close($f);
        }
    }elsif($ARGV[1] =~ /^:(.*)/){
        #if commit is omitted, read from index
        print "legit: error: invalid filename ''\n" unless defined $1;
        if(! -e ".legit/index/$1"){
            print "legit.pl: error: '$1' not found in index", "\n";
        }else{
            open my $f, "<", ".legit/index/$1" or die "failed to open";
            @lines = <$f>;
            foreach my $line(@lines){
                print "$line";
            }
            close($f);
        }
    }
}

sub remove{
    if(($ARGV[1] eq "--force" and $ARGV[2] eq "--cached") or ($ARGV[1] eq "--cached" and $ARGV[2] eq "--force")){
        foreach my $arg(@ARGV[3..$#ARGV]){  
            if(! -e ".legit/index/$arg"){
                print "legit.pl: error: '$arg' is not in the legit repository\n";
            }else{
                unlink ".legit/index/$arg"; 
            }              
        }
    }elsif($ARGV[1] eq "--force"){
        foreach my $arg(@ARGV[2..$#ARGV]){
            if(! -e ".legit/index/$arg"){
                print "legit.pl: error: '$arg' is not in the legit repository\n";
            }else{
                unlink $arg and unlink ".legit/index/$arg";
            }
        }
    }elsif($ARGV[1] eq "--cached"){
        foreach my $arg(@ARGV[2..$#ARGV]){
            if(! -e ".legit/$arg" and ! -e ".legit/index/$arg"){
                print "legit.pl: error: '$arg' is not in the legit repository\n";
            }elsif(compare(".legit/index/$arg", $arg) and compare(".legit/$arg", ".legit/index/$arg")){
                print "legit.pl: error: '$arg' in index is different to both working file and repository\n";
            }else{
                unlink ".legit/index/$arg";
            }
        }
    }else{
        #give error message in different cases otherwise delete file
        foreach my $arg(@ARGV[1..$#ARGV]){
            if(! -e ".legit/$arg" and ! -e ".legit/index/$arg"){
                print "legit.pl: error: '$arg' is not in the legit repository\n";
            }elsif(-e ".legit/index/$arg" and ! -e ".legit/$arg"){
                print "legit.pl: error: '$arg' has changes staged in the index\n";
            }elsif(compare(".legit/index/$arg", $arg) and compare(".legit/$arg", ".legit/index/$arg")){
                print "legit.pl: error: '$arg' in index is different to both working file and repository\n";
            }elsif(compare(".legit/index/$arg", $arg) and ! compare(".legit/$arg", ".legit/index/$arg")){
                print "legit.pl: error: '$arg' in repository is different to working file\n";
            }elsif(! compare(".legit/index/$arg", $arg) and compare(".legit/$arg", ".legit/index/$arg")){
                print "legit.pl: error: '$arg' has changes staged in the index\n";
            }elsif(! compare(".legit/index/$arg", $arg) and ! compare(".legit/$arg", $arg)){
                unlink ".legit/index/$arg" and unlink "$arg";
            }
        } 
    }
}

sub status{
    my @nfiles = glob ".legit/commit/*";
    print "legit.pl: error: your repository does not have any commits yet\n" and exit(1) if @nfiles == 1;
    #collect all the files
    my @files = glob "*";
    my @array1 = grep{ !/(commit|index)/ } glob (".legit/*");
    my @array2 = glob ".legit/index/*";
    push @array1, @array2;
    foreach (@array1){
        push @files, $1 and next if $_ =~ /.legit\/index\/(.*)/;
        push @files, $1 and next if $_ =~ /.legit\/(.*)/;
    }    
    #remove dulplicate
    my %hash; 
    @hash{ @files } = (); 
    my @uniq_files = sort keys %hash;    
    #fcheck file's status by checking its existance and difference with other file
    foreach my $file(@uniq_files){
        $fileI = ".legit/index/$file";  #file in index
        $fileR = ".legit/$file";        #file in repository
        if(-e $file and ! -e $fileI){
            print "$file - untracked\n";               
        }elsif(! -e $file and ! -e $fileI and -e $fileR){
            print "$file - deleted\n"
        }elsif(! -e $file and -e $fileI and -e $fileR){
            print "$file - file deleted\n";
        }elsif(-e $file and -e $fileI and ! -e $fileR){
            print "$file - added to index\n";
        }elsif(compare($file, $fileI) and compare($file, $fileR) and compare($fileI, $fileR)){
            print "$file - file changed, different changes staged for commit\n";
        }elsif(compare($file, $fileI) and compare($file, $fileR) and ! compare($fileI, $fileR)){
            print "$file - file changed, changes not staged for commit\n";
        }elsif(! compare($file, $fileI) and compare($file, $fileR) and compare($fileI, $fileR)){
            print "$file - file changed, changes staged for commit\n";
        }elsif(! compare($file, $fileI) and ! compare($file, $fileR) and ! compare($fileI, $fileR)){
            print "$file - same as repo\n";
        }
    }
}

