%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern FILE* yyin;
extern FILE* yyout;
%}
%token IF ELSE STMT CND
%start s
%union{
	long l;
	char* str;
	int i;
};
%type<str> IF
%type<str> ELSE
%type<str> STMT
%type<str> CND
%%
s:
	condStmt '$' { return 1;}
	;
condStmt:
	ifelse condStmt	
	| if condStmt  
	|
	;
ifelse:
	IF '(' CND ')' '{' stmt '}' ELSE '{' stmt '}' 
	;
if:
	 IF '(' CND ')' '{' stmt '}' {fprintf(yyout,"else{}");}
	;
stmt:
	STMT 
	|condStmt
	;
%% 
void yyerror(char* s){
	printf("%s",s);
}
int main(){
	yyin = fopen("if.txt","r");
	yyout = fopen("ifOut.txt","w");
	int i = 5;	
	while(i--){
		yyparse();
		fprintf(yyout,"\n");
		prev="";
	}
	fclose(yyin);
	return 0;
}
