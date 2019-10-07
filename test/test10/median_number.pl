#!/usr/bin/perl -w 

my @array = @ARGV;
for ($i = 0; $i < $#array; $i += 1) {
    for ($j = 0; $j < $#array; $j += 1){
        if ($array[$j] >= $array[$j+1]){
            $temp = $array[$j];
            $array[$j] = $array[$j+1];
            $array[$j+1] = $temp;
        }
    }
}     

$median = @array / 2;
print "$array[$median]\n";
