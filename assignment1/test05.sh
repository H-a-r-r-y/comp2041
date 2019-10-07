## tests focus on remove and status command 

#test for status after commit normally
legit.pl init 
touch a b c d e
echo 1 > a
echo 2 > b
echo 3 > c
legit.pl add a b c
legit.pl status
legit.pl commit -m "first"
legit.pl add d
legit.pl status
#test for status after different removals 
echo something >> a
echo something >> b
legit.pl add b
legit.pl status
legit.pl commit -a -m "second"
legit.pl status
legit.pl rm --force a
legit.pl rm a e
legit.pl rm --cached d 
legit.pl add d 
legit.pl status
legit.pl rm --cached --force b
legit.pl status 

