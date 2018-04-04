%{
#include<stdio.h>
#include<ctype.h>
#define YYSTYPE char;
int f=0;
%}
%token id err
%left '-' '+'
%left '*' '/'
%%
input:
	|input exp{}
	|error {f=1;}
	;
exp:
	 exp'+': exp {printf("+");}
	|exp'-': exp {printf("-");}
	|exp'*': exp {printf("*");}
	|exp'/': exp {printf("/");}
	

~                                 
~                                 
~                                

