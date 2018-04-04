let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>
char init[50],cond[50],inc[50];
%}
%%
"while" {printf("for");}
[\(] {printf("%s",yytext);}
({let}+|{dig}+)"="({let}+|{dig}+); { strcpy(init,yytext); }
({let}+|{dig}+)[<=>]*({let}+|{dig}+) { strcpy(cond,yytext); }
(({let}+|{dig}+)"++"|({let}+|{dig})+"--") { strcpy(inc,yytext); }
. {}
[ \n\t] {}
%%
int main()
{
yylex();
printf("%s%s;%s)",init,cond,inc);
return 0;
}



