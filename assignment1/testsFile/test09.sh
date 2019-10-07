legit.pl init
echo a > a
legit.pl add a
legit.pl commit -m "commit1"
legit.pl branch branch0
legit.pl branch
legit.pl checkout branch0
echo hello > a
legit.pl add a
legit.pl commit -m "commit2"
legit.pl checkout master
legit.pl merge branch0
