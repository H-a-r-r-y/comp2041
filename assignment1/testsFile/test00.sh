legit.pl init
legit.pl status
echo a > a
echo b > b
echo c > c
legit.pl add a b c
legit.pl commit -m "abc"
legit.pl show 0:a
legit.pl status
legit.pl log

