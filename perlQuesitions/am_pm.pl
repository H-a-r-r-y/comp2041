#!/usr/bin/perl -w


while($line =<STDIN>){
    $line =~ / (\d+):/;
    $hour = $1;
    if($hour eq "00"){
        $line =~ s/$hour/12/;
        $line =~ s/:(\d+) /:$1am /;
        print "$line"
    }elsif($hour < "12"){
        $line =~ s/:(\d+) /:$1am /;
        print "$line"
    }elsif($hour == "12"){
        $line =~ s/:(\d+) /:$1pm /;
        print "$line"
    }else{
        $new_hour = $hour - 12;
        if($new_hour < 10){
             $line =~ s/$hour/0$new_hour/;
        }else{
            $line =~ s/$hour/$new_hour/;
        }
        $line =~ s/:(\d+) /:$1pm /;     
        print "$line"
    }
}
