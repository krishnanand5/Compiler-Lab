let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>
%}

%%
("+"|"*"|"/"|"^"|"-")+({let}*{dig}*)+ {printf("%s is a prefix expression\n",yytext);}
({let}*{dig}*)+("+"|"*"|"/"|"^"|"-")+ {printf("%s is a postfix expression\n",yytext);}
(({let}*{dig}*)+("+"|"*"|"/"|"^"|"-")+({let}*{dig}*)+)+ {printf("%s is a infix expression\n",yytext);}

[ \t\n] {}
.* {}
%%
int main(int argc,char *argv[])
{
int i;
for(i=1;i<argc;i++){
yyin=fopen(argv[i],"r");
yylex();
}


return 0;
}


