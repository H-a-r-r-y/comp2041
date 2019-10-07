#!/usr/bin/perl -w

sub sum1 {
    my (@list) = @_;
    my $total = 0;
    foreach $ele (@list){
        $total += $ele;
    }
    return $total;
}

sub sum2 {
    my (@list) = @_;
    return 0 if ! @list;
    return $list[0] + sum2(@list[1..$#list]);
}

print sum1(1..10), "\n", sum2(1..10), "\n";
