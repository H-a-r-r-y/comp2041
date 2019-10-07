#!/usr/bin/perl -w

exit(1) if $ARGV[0] eq "/dev/null";
open F, "<", "$ARGV[0]" or die "cant open";
@ARGV = <F>;
print "$ARGV[$#ARGV/2]" if @ARGV % 2 != 0;
print "$ARGV[@ARGV/2-1]$ARGV[@ARGV/2]" if @ARGV %2 == 0;
