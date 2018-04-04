%{
#include<stdio.h>
%}

%%
(("aa")+b+) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}

