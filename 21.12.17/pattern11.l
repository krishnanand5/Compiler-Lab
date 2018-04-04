%{
#include<stdio.h>
%}

%%
("aa")+b(bb)* { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}
