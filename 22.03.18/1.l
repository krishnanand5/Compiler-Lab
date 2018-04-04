%{
#include "y.tab.h"
%}
%%
"int" {return INT;}
"float" {return FLOAT;}
"char" {return CHAR;}
"double" {return DOUBLE;}
[a-z]+ {yylval=yytext;return ID;}
"," {return C;}
"=" {return EQ;}
[+\-*/] {return OP;}
[0-9]+ {yylval=yytext;return DEC;}
[0-9*]"."[0-9]+ {yylval=yytext;return FLO;}
[\n] {return NL;}
";" {return SE;}
[ ] {}
%%
int main(){
yyparse();
}
