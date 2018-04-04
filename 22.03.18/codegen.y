%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%%

S : ID{push();} '='{push();} E{codegen_assign();}
   ;
E : E '+'{push();} T{codegen();}
   | E '-'{push();} T{codegen();}
   | T


   ;
T : T '*'{push();} F{codegen();}
   | T '/'{push();} F{codegen();}
   | F
   
   ;
F : '(' E ')'
   | '-'{push();} F{codegen_umin();} %prec UMINUS
   | ID{push();}
   | NUM{push();}
   ;
%%


#include "lex.yy.c"
#include<ctype.h>
char st[100][10];
int top=0;
char i_[2]="0";
char temp[2]="t";

void push()
{
  strcpy(st[++top],yytext);
 }

void codegen()
 {
 strcpy(temp,"t");
 strcat(temp,i_);
  //printf("%s = %s %s %s\n",temp,st[top-2],st[top-1],st[top]);
 char * a,*b,*c,*d;
a=temp;
b=st[top-2];
c=st[top-1];
d=st[top];
char *p1="ADD",*p2="SUB",*p3="MUL",*p4="DIV";
switch(c[0])
{case '+':
 c=p1;
break;
case '-':
c=p2;
break;
case '*':
c=p3;
break;
case '/':
c=p4;
break;
}
printf("LD R0 %s\n",d);
printf("LD R1 %s\n",b);
printf("%s R2 R1 R0\n",c);
printf("ST %s R2\n",a);
  top-=2;
 strcpy(st[top],temp);
 i_[0]++;
 }

void codegen_umin()
 {
 strcpy(temp,"t");
 strcat(temp,i_);
 printf("%s = -%s\n",temp,st[top]);
 top--;
 strcpy(st[top],temp);
 i_[0]++;
 }

void codegen_assign()
 {
 //printf("%s = %s\n",st[top-2],st[top]);
char * a,*b;
a=st[top-2];
b=st[top];
printf("LD R0 %s\n",b);
printf("ST %s R0\n",a);
 top-=2;
 }
int main()
{
yyparse();
}
