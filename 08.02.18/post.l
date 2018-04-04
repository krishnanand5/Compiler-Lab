%{
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
#define NUM  258
%}
%%
[0-9] {
  yylval.dval=atof(yytext);
  return NUM;
 }
[t];
n return 0;
. {return yytext[0];}
%%
void yyerror(char * str)
{
 printf("n Invalid Expression...");
}
int main()
{

 yyparse();
 return(0);
}

