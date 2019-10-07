##tests focus on branch and merge
legit.pl init
echo 1 > a
legit.pl add a 
legit.pl commit -m "1"
legit.pl branch b1
legit.pl checkout b1
echo 2 > b
legit.pl add b 
legit.pl commit -m "2"
legit.pl checkout master
legit.pl merge b1 -m "merge"
legit.pl log
legit.pl branch b2
legit.pl checkout b2
touch a b 
legit.pl add a b 
legit.pl commit -m "3"
legit.pl checkout master
legit.pl merge b2 -m "merge2"


