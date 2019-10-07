legit.pl init
echo a > a
echo b > b
echo c > c
legit.pl add a b c
legit.pl commit -m "commit1"
echo hello >> a
echo hi >> b
echo hola >> c
echo hey > d
echo line1 > e
echo line2 > f
legit.pl add  b c d e
legit.pl rm --force --cached b f
legit.pl rm --cached --force f
legit.pl status
