%{
#include<stdio.h>
%}

%%
(("/*").*("\"\*/\"")*.*("*/")) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


