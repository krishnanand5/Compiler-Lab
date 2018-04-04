%{
#include<stdio.h>
%}

%%
((a|b)*"abb") { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}

