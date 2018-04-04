%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern FILE* yyin;
extern FILE* yyout;
%}
%token DO WH INIT INC STMT CND
%start s
%union{
	long l;
	char* str;
	int i;
};
%type<str> DO
%type<str> WH
%type<str> INIT
%type<str> INC
%type<str> STMT
%type<str> CND
%%
s:
	dowhile '$' { return 1;}
	;

dowhile: INIT DO '{' stmt INC '}' WH '(' CND ')' ';'
         ;

stmt:
	STMT 
	|dowhile
	;
%% 
void yyerror(char* s){
	printf("%s",s);
}
int main(){
	yyin = fopen("do.txt","r");
	yyout = fopen("doOut.txt","w");
	int i = 1;
	while(i--){
		yyparse();
		fprintf(yyout,"\n\n\n");
		prev="";
	}
	fclose(yyin);
	return 0;
}
