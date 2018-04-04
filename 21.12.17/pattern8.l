%{
#include<stdio.h>
%}

%%
(a.*e.*i.*o.*u.*) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}

