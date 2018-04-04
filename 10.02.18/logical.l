%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char*);
#include "y.tab.h"
%}

%%

0 {
        printf("%s",yytext);
        yylval=atoi(yytext);
        return BIN;
}

1 {
         printf("%s",yytext);
        yylval=atoi(yytext);
        return BIN;
}

"&" {
                        printf("%s",yytext);
                        return *yytext;
}


"|" {
                        printf("%s",yytext);
                        return *yytext;
}

"!" {
                        printf("%s",yytext);
                        return *yytext;
}

"\n" {
                        return *yytext;
}

[ \t] ;

. yyerror("invalid character");


%%

