##test for merge in different branches
legit.pl init 
legit.pl branch b1
legit.pl checkout b1
touch a b c
legit.pl add a b c
legit.pl commit -m "1"
legit.pl rm --force --cached a b  
legit.pl commit -m "2"
legit.pl checkout master 
legit.pl merge b1 "merge1"
legit.pl branch b2
legit.pl checkout b2
legit.pl merge b1 "merge2"
