%{
	#include<stdio.h>
	#include"y.tab.h"
	char *prev = "";
	char *init,*inc;
%}
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]* 
CONSTANT [0-9]+
%%
"init"		{
                           //fprintf(yyout,"%s",yytext);
			init = strdup(yytext);
			return INIT;
		}
"for"		{
			fprintf(yyout,"%s","while");
			//prev = strdup(yytext);
			return FOR;
		}
		
"c"		{
			fprintf(yyout,"%s",yytext);
			//prev = strdup(yytext);
			return CND;
		}
				
"inc"		{
                           //fprintf(yyout,"%s",yytext);
			inc = strdup(yytext);
			return INC;
		}
s[0-9]		{        fprintf(yyout,"%s","\n");
			fprintf(yyout,"%s",yytext);
			return STMT;
		}
";" 		{
						
			return *yytext;
		}

[(){]	         {
			fprintf(yyout,"%s",yytext);
			return *yytext;
		}
[}]                 {
                           fprintf(yyout,"%s","\n");
                           fprintf(yyout,"%s",inc);
                           fprintf(yyout,"%s",yytext);
			return *yytext;

                  }
[ \n\t]     ;
[$]		{
			fprintf(yyout,"%s",yytext);			
			return *yytext;
		}		
.		{ 
			printf("Invalid character!");
		}
%%
int yywrap(void){
	return 1;
}
/*int main(){
	yylex();
}*/
