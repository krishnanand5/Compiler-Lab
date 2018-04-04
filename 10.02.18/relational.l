%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char*);
#include "y.tab.h"
%}

%%

[0-9]+ {
        printf("%s",yytext);
        yylval=atoi(yytext);
        return INTEGER;
}

">" {
                        printf("%s",yytext);
                        return *yytext;
}


"<" {
                        printf("%s",yytext);
                        return *yytext;
}

"=" {
                        printf("%s",yytext);
                        return *yytext;
}

"\n" {
                        return *yytext;
}

[ \t] ;

. yyerror("invalid character");


%%

