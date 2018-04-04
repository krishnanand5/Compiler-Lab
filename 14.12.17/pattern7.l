dig [0-9]

%{
#include<stdio.h>
%}

%%
{dig}*([.]{dig}*)?([Ee][+-]?{dig}*)? { printf("%s\n",yytext);}
[ \t\n]+ {}
.* {}
%%

int main()
{
yylex();
return 0;
}
