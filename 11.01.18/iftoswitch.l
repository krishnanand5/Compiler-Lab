let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>

%}
%%
"else if(".*")" {printf("case");  printf("%d : ",yytext[11]-'0');}
"if(".*")" {printf("switch(%c)case%c:",yytext[3],yytext[6]); }
.* {}
[ \n\t] {}
%%
int main()
{
yylex();
return 0;
}



