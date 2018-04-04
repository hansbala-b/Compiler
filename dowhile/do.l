%{
	#include<stdio.h>
	#include"y.tab.h"
	char *prev = "";
	char *init,*inc,*cond="",*stat="";
%}
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]* 
CONSTANT [0-9]+
%%
"init"		{
                           fprintf(yyout,"%s",yytext);
                           fprintf(yyout,"%s","\n");
			return INIT;
		}
"do"		{
			fprintf(yyout,"%s","while(");
			return DO;
		}
		
"while"		{
			return WH;
		}
				
"c"		{
			fprintf(yyout,"%s",yytext);  
			fprintf(yyout,"%s",")\n");
                                              
			return CND;
		}
				
"inc"		{

			inc = strdup(yytext);
			return INC;
		}
s[0-9]		{        stat = strdup(yytext);
			return STMT;
		}
";" 		{
			fprintf(yyout,"%s","{");
			fprintf(yyout,"%s",stat);
			fprintf(yyout,"%s","\n");
			fprintf(yyout,"%s",inc);
			fprintf(yyout,"%s","\n");
			fprintf(yyout,"%s","}");
                           
                           			
			return *yytext;
		}

[()]              { 
			return *yytext;
		}
[{]	         {
			return *yytext;
		}
[}]               {
                          return *yytext;

                  }
[ \n\t]     ;
[$]		{
			
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
