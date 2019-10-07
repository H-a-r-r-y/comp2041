legit.pl init
legit.pl branch
echo a > a
legit.pl add a
echo line1 >> a
legit.pl commit -a -m "commit1"
legit.pl branch master
legit.pl branch branch0
legit.pl branch
legit.pl branch -d branch0
legit.pl branch
