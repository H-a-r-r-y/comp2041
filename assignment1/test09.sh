#test for merge conflict maybe
legit.pl init 
legit.pl branch b1 
legit.pl branch b2 
legit.pl checkout b1 
echo hello > a
echo world >> a
legit.pl add a
legit.pl commit -m "1"
legit.pl checkout b2
echo hello1 > a
echo world1 > a
legit.pl add a 
legit.pl commit a 
legit.pl merge b1 "merge"
legit.pl checkout master 
legit.pl merge b2 "merge2"

