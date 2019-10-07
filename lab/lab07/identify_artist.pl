#!/usr/bin/perl -w 
foreach $arg(@ARGV){
    open F, '<', "$arg" or die "fail to open";    
    while($line = <F>){
         $line = lc $line;
         @words = $line =~ /[a-zA-Z]+/g;
         foreach my $word(@words){
             foreach $file (glob "lyrics/*.txt"){
                open my $f, '<', "$file" or die "cant open file $file: $!";
                $file =~ /\/(.*)\./;
                $singer = $1;
                $singer =~ s/_/ /g;
                $wordNum = total_word($f);
                open $f, '<', "$file" or die "cant open file $file: $!";
                $word_occur = occurance($f, $word);
                $log = log(($word_occur + 1)/ $wordNum);
                $probability{$singer}{$word} = $log if ! defined $probability{$singer}{$word};
                $probability{$singer}{$word} += $log;
            }
        }
    }
    foreach $singer(keys %probability){
        $pro{$singer} = 0;
        foreach $word(keys %{$probability{$singer}}){
            $pro{$singer} += $probability{$singer}{$word};
        }
    }
    foreach $singer(%pro){
        if(! defined $p){
            $p = $pro{$singer};
            $pro_singer = $singer;
        }
        if($pro{$singer} < $p){
            $p = $pro{$singer};
            $pro_singer = $singer;
        }   
    }
    print "$arg most resembles the work of $pro_singer (log-probability=$p)";
}

#sub-function to count total number of word
sub total_word{
    my ($file) = @_;  
    my $sum = 0;
    while(my $line = <$file>){
        my @array = $line =~ /[a-zA-Z]+/g;
        $sum += @array; 
    }
    return $sum;
}
#sub-function to how many times a word occur
sub occurance{
    my $result = 0;
    my ($file, $word) = @_;
    while(my $line = <$file>){
        $line = lc $line;
        my @array = $line =~ /[a-zA-Z]+/g;
        foreach my $i(@array){
            if($word =~ /^$i$/){
                $result += 1;
            }
        }
    }
    return $result;
}
