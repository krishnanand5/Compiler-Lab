%{
#include<stdio.h>
%}

%%
(("ab")+) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


