
#tests for add commit 

#test for normal commit
legit.pl init 
touch a b c d e 
legit.pl add a b c
legit.pl commit -m "commit 1"

#test for commit modified file and file been removed
echo some >a
rm b 
legit.pl add a e b 
legit.pl commit -m "commit 2"
echo hello >>e
legit.pl commit -a -m "commit 3"

