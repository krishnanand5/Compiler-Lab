%{
#include<stdio.h>
%}

%%
[^a-z]+ { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


