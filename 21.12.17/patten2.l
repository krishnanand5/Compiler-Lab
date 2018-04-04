%{
#include<stdio.h>
%}

%%
([a-zA-Z]+) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


