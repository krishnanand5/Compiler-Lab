%{
#include<stdio.h>
%}

%%
([+-]?[0-9]+) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


