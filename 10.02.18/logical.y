%{ 
#include<stdio.h>
#include<stdlib.h>
int yylex();

void yyerror(char*);

%}


%token BIN;
%left '&'
%left '|'
%left '!'

%%

prog: prog expr '\n'     {printf("%d\n",$2);}
      |  ;

expr: BIN      {$$=$1;}
      | expr '&' expr { $$=$1 & $3;}
      | expr '|' expr { $$=$1 | $3;}
      | '!' expr { $$=!$2; }
      ;
%%

void yyerror(char*s){

fprintf(stderr,"%s\n",s);
}

int main(){
yyparse();
return 0;
}

