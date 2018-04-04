lex do.l
yacc -d do.y
gcc lex.yy.c y.tab.c
./a.out
