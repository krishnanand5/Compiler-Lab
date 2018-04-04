let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>
char init[50],cond[50],inc[50],init1[50],cond1[50],inc1[50],wh[50],wh1[50];
int seen = 0;
%}
%%
"while" {if(seen==0) {strcpy(wh,"for");} else strcpy(wh1,"for");}
[\(] {}
({let}+|{dig}+)"="({let}+|{dig}+); { if(seen == 0) {strcpy(init,yytext);} else strcpy(init1,yytext); }
({let}+|{dig}+)[<=>]*({let}+|{dig}+) { if(seen == 0 ){seen++;strcpy(cond,yytext);} else strcpy(cond1,yytext); }
(({let}+|{dig}+)"++"|({let}+|{dig})+"--") { if(seen == 0) {strcpy(inc,yytext);} else {strcpy(inc1,yytext);seen--;} }
. {}
[ \n\t] {}
%%
int main()
{
yylex();
printf("%s(%s%s;%s) {\n %s(%s%s;%s){}\n }",wh,init,cond,inc,wh,init1,cond1,inc1);
return 0;
}



