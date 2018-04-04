%{
#include<stdio.h>
%}

%%
([a-zA-Z]*[0-9][a-zA-Z]*) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%
 
int main()
{
yylex();
return 0;
}


