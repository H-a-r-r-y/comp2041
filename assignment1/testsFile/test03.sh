legit.pl init
echo a > a
echo b > b
legit.pl add a b
legit.pl commit -m "first commit"
echo line1 >> a
legit.pl commit -a -m "second commit"
legit.pl show 1:a
legit.pl status
rm a
legit.pl commit -a -m "third commit"
legit.pl status
