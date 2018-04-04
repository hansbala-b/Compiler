filename=$1
lex $filename".l"
yacc -d $filename".y" 
./a.out <tree.txt >treeOut.txt

