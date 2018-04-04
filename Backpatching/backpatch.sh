filename=$1
lex $filename".l"
yacc -d $filename".y" 
g++ lex.yy.c $filename".tab.c" 
./a.out <backpatch.txt >backpatchOut.txt

