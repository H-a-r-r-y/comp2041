##tests focus on branches and switches between them 
legit.pl init 
touch a b c 
legit.pl add a b c
legit.pl commit -m "1st commit"
legit.pl branch b1
legit.pl checkout b1
echo something > d 
legit.pl add d
legit.pl commit -m "2nd commit"
legit.pl checkout master
legit.pl branch b2
legit.pl checkout b2
echo something > e
legit.pl add e 
legit.pl commit -m "3rd commit"
legit.pl checkout b1
legit.pl checkout master
legit.pl checkout master
legit.pl checkout non-existence




