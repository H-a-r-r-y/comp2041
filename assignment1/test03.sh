#tests for commit show log commands
#test for adding without initialization
touch a
legit.pl add 
legit.pl init 
legit.pl add a 
#test show in different commits
echo abcdef > a
legit.pl commit -m "1"
legit.pl commit -a -m "2"
legit.pl show :a
legit.pl show 1:a
legit.pl show 2:a
legit.pl show :a
legit.pl log 
echo hello > b
legit.pl add b
legit.pl commit -a -m "3"
legit.pl show 1:b
legit.pl show 2:b
legit.pl log
legit.pl commit -m "4"
