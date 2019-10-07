legit.pl init
echo 'first line for a' > a
echo 'first line for b' > b
legit.pl commit -a -m "helo"
legit.pl add a b
legit.pl show 0:a
legit.pl commit -m "hello"
legit.pl show 0:a
legit.pl show 1:a
rm a
legit.pl add a


