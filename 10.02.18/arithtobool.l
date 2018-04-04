let [a-zA-Z]
dig [0-9]
%{
%}
%%
"+" { printf("|");}
"*" { printf("&"); }
{let}+|{dig}+ {printf("%s",yytext);}
[ \n\t] {} 
. {}
%%
int main()
{
yylex();
return 0;
}
