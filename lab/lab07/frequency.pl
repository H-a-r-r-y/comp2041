#!/usr/bin/perl -w


foreach $file (glob "lyrics/*.txt"){
    open my $f, '<', "$file" or die "cant open file $file: $!";
    $file =~ /\/(.*)\./;
    $singer = $1;
    $singer =~ s/_/ /g;
    $word = $ARGV[0];
    $wordNum = total_word($f);
    open $f, '<', "$file" or die "cant open file $file: $!";
    $word_occur = occurance($f, $word);
    $frequency{$singer}{$word_occur} = $wordNum; 
}
##print the outcome
foreach $singer(sort keys %frequency){
    foreach $word_occur(keys %{$frequency{$singer}}){
        $f = $word_occur / $frequency{$singer}{$word_occur};
        printf "%4d/%6d = %.9f $singer\n", $word_occur, $frequency{$singer}{$word_occur},$f;
    }
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
