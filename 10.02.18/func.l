%{
#include<stdio.h>
int i;
%}
%%
"void"  {printf("#define ");}

[a-z]+[ ]*"(" { printf("%s",yytext);}
")" {printf("%s",yytext);}
"int"|"float"|"char" {}

[a-z] {printf("%s",yytext);}
[-+*/] {printf("%s",yytext);}

"{"|"}" {}
[ \n\t] {}
. {}
%%
int main()
{
yylex();
return 0;
}

