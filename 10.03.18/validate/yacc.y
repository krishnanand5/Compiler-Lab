%{
	#include<stdio.h>
	void yyerror(char *s);
	int yylex(void);
%}

%token NUM ID FOR WHILE IF ELSE END OP RELOP ITR LOGOP

%%
S	:LOOPS
	;

LOOPS	:LOOPS LOOP
	|
	;

LOOP	:HEAD BODY	{printf("Valid\n");}
	|HEAD END	{printf("Valid\n");}
	;

HEAD	:WHILE '(' C ')'
	;

BODY	:'{' STATEMENTS '}'
	;
STATEMENTS	:STATEMENTS E END
		|STATEMENTS I END
		|STATEMENTS LOOP
		|
		;
E	:E OP E
	|ID
	|NUM
	;
C	:E RELOP E
	|E
	|C LOGOP C
	|'(' C ')'
	;
I	:E ITR
	|ITR E
	|E
	;
%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	yyparse();
	return 0;
}
