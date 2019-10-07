legit.pl init
echo a > a
legit.pl add a
legit.pl commit -m "hello"
legit.pl status
legit.pl rm --cached a
echo line1 >> a
legit.pl status
echo b > b
legit.pl add b
legit.pl commit -m "hi"
echo hello > b
legit.pl add b
legit.pl status

