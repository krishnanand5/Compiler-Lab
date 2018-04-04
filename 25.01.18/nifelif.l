let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>
char cond[50],cond1[50];
int seen=0;
%}
%%
"if" {}
"else" {}
({let}+|{dig}+)[<=>]*({let}+|{dig}+) {if(seen==0) {strcpy(cond,yytext); seen++;} else {strcpy(cond1,yytext);}}
. {}
[ \n\t] {}
%%
int main()
{
yylex();
printf("if(%s)&&(%s){}\nelse if(%s){}\nelse{}\n",cond,cond1,cond);
return 0;
}



