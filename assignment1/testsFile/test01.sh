legit.pl init
legit.pl status
echo a > a
echo b > b
legit.pl add a b
legit.pl commit -m "first commit"
legit.pl status
echo line 2 >> a
legit.pl add a b
legit.pl commit -m "second commit"
legit.pl status
legit.pl show 0:a
legit.pl show 1:a
legit.pl show :a
legit.pl show 0:b
legit.pl show 1:b
legit.pl show :b

