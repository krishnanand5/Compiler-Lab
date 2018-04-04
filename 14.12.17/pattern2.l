%{
#include<stdio.h>
%}

%%
([0-9]+[a-zA-Z]) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}

