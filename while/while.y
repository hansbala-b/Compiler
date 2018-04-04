%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern FILE* yyin;
extern FILE* yyout;
%}
%token FOR INIT INC STMT CND
%start s
%union{
	long l;
	char* str;
	int i;
};
%type<str> FOR
%type<str> INIT
%type<str> INC
%type<str> STMT
%type<str> CND
%%
s:
	for '$' { return 1;}
	;
for:
	FOR '(' INIT ';' CND ';' INC ')' '{' stmt'}' 
	;
stmt:
	STMT 
	|for
	;
%% 
void yyerror(char* s){
	printf("%s",s);
}
int main(){
	yyin = fopen("while.txt","r");
	yyout = fopen("whileOut.txt","w");
	int i = 2;
	while(i--){
		yyparse();
		fprintf(yyout,"\n\n\n");
		prev="";
	}
	fclose(yyin);
	return 0;
}
