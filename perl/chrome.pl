#!/usr/bin/perl -w

foreach $url (@ARGV) {
    open my $f, '-|', "wget -q -O- '$url'" or die;
    while ($line = <$f>) {
        if ($line =~ /^\s*<(script|style)/i) {
            while ($line = <$f>) {
                last if $line =~ /^\s*<\/(script|style)/i;
            }
        } else {
            $line =~ s/&\w+;/ /g;
            $line =~ s/<[^>]*>//g;
            print $line if $line =~ /\S/;
        }
    }
    close $f;
}
