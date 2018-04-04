dig [0-9]
let [a-z]
%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"double" { return DT; }
"for" { return FOR; }
[a-zA-Z][a-zA-Z0-9]* { return ID; }
{dig}* {return NUM;}
"=" { return EQ; }
"<" { return LT; }
"<=" { return LE; }
">" {return GT; }
">=" {return GE; }
"!=" { return NE; }
"," { return COM; }
";" { return SC; }
"++" { return INC; }
"--" {return DEC; }

"+=" { return PEQ; }
"-=" { return MEQ; }
\n {return NL;}
[ \t] {}
. { }
%%



