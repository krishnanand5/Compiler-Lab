letter [a-zA-Z]
digit [0-9]
%{
#include<stdio.h>
%}

%%
letterdigitletter {printf(" %s\n",yytext);}
letterletterletter {printf(" %s\n",yytext);}


%%

int main()
{
yylex();
return 0;
}
