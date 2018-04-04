%{
#include<stdio.h>
int i;
%}
%%
"#define "[a-z]+"("[a-z]") "[a-zA-Z0-9+-/*()]* {
printf("void ");
for(i=8;yytext[i]!='(';i++) printf("%c",yytext[i]);
printf("(int ");
for(++i;yytext[i]!=')';i++) printf("%c",yytext[i]);
printf(")\n{\ncout<<");
++i;++i;
for(;i<yyleng;i++) printf("%c",yytext[i]);
printf(";\n}");
}
%%
int main()
{
yylex();
return 0;
}

