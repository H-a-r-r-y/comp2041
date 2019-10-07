legit.pl init
echo a > a
legit.pl add a
legit.pl commit -m "commit1"
legit.pl rm --cached a
legit.pl status
echo b > b
echo c > c
echo d > d
legit.pl add b c d
rm b
echo line 2 > c
legit.pl status
echo d > d
legit.pl add d
legit.pl commit -m "commit2"
legit.pl rm --cached d
legit.pl status
echo e > e
legit.pl add e
legit.pl commit -m "commit3"
echo hello >> e
legit.pl add e
rm e
legit.pl status
