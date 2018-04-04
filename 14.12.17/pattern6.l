letter [a-zA-Z]
digit [0-9]
%{
#include<stdio.h>
%}

%%
([a-zA-Z]+[_](([a-zA-Z]+[_])|[0-9])*) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}

