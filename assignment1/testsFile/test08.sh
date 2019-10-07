legit.pl init
legit.pl branch branch0
echo a > a
legit.pl add a
legit.pl commit -m "commit1"
legit.pl checkout branch0
echo b > b
legit.pl add b
legit.pl commit -m "commit2"
legit.pl checkout master
legit.pl branch
legit.pl checkout inexistent
