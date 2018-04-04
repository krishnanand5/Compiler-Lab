dig [0-9]
let [a-zA-Z]
%{
#include<string.h>
#include<stdio.h>
int id =0, num=0,space=0,op =0,assign=0,key=0;
 char *a="no";
%}

%%
("def"|"return"|"else"|"print"|"if") { key++;printf("%s is an identifier\n",yytext); }
([a-zA-Z]+) { id++;printf("%s is an identifier\n",yytext);}
{dig}*([.]{dig}*)?([Ee][+-]?{dig}*)? { num++;printf("%s is a number\n",yytext);}
("<="|">=") { op++; printf("%s is a relational operator\n",yytext);}
"=" {assign++;printf("%s is assignment operator\n",yytext); }

("++"|"--") {op++;printf("%s is pre-increment operator\n",yytext);}
([*+-/:()]) {op++;printf("%s is an operator\n",yytext); }

[ \t\n]+ {space++;}
. {}
%%
int yywrap()
{
 if(strcmp(a,"no")==0)
 {
 yyin=fopen("1b.txt","r");
 a="fds";
 return 0;
 }
else
{
 return 1;
}
}
int main(int argc, char* argv[])
{
int i=1;
//for(i;i<argc;i++)
{
//printf("Reading file i=%d\n",i);
yyin=fopen("1a.txt","r");
yylex();
printf("There are %d identifiers, %d numbers, %d assignment operators, %d spaces %d keywords and %d operators\n",id,num,assign,space,key,op);
}
return 0;
}

