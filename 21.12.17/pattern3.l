%{
#include<stdio.h>
%}

%%
(d.*[t$]) { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}


