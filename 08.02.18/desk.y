%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER
%%
program:
	program expr '\n'  { printf("%d\n", $2); }
	|
	;
expr:
	INTEGER      	 { $$ = $1; }
	| expr '+' expr	 { $$ = $1 + $3; printf("Addition\n"); }
	| expr '-' expr	 { $$ = $1 - $3; printf("Subtraction\n"); }
	| expr '*' expr  { $$ = $1 * $3; printf("Multiplication\n");}
	| expr '/' expr  { $$ = $1 / $3; printf("Division\n");}	
	
; 


%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
