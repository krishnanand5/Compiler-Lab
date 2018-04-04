%{ 
#include<stdio.h>
#include<stdlib.h>
int yylex();

void yyerror(char*);

%}


%token INTEGER;
%left '>'
%left '<'
%left '='

%%

prog: prog expr '\n'     {printf("\n%d\n",$2);}
      |  ;
gop : '>' 
    ;
lop : '<';
eq : '=' ;
ge : gop eq;
le : lop eq;
neq : lop gop;
eqv : eq eq;   

expr: INTEGER     {$$=$1;}
      | expr '>' expr { if($1 > $3) 
                          $$=1; 
                        else 
                       $$= 0; }
      | expr '<' expr { if($1< $3)
			 $$= 1;
			else
			$$= 0; }	
      | expr eqv expr { if($1==$3)
			 $$= 1;
			else 
			$$= 0; }
      |expr ge expr { if($1 >= $3)
                         $$= 1;
                        else
                        $$= 0; } 
      |expr le expr { if($1 <= $3)
                          $$=1;
                        else
                       $$= 0; }
      |expr neq expr { if($1!=$3)
			$$=1;
			else
			$$=0;
			}	

      ;
%%

void yyerror(char*s){

fprintf(stderr,"%s\n",s);
}

int main(){
yyparse();
return 0;
}

