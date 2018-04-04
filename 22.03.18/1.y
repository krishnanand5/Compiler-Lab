%{
#include<assert.h>
#include<stdio.h>
#include<string.h>
void insert(int);
void yyerror();
int yylex();
int summa,ltyp,rtyp,err_no=0,fl=0,i=0,j=0,type[100],addr[100];
char symbol[100][100],temp[100],data[100][100];
%}
%token EQ OP DEC FLO ID NL SE C INT FLOAT CHAR DOUBLE
%%
START:START S1 NL
|
;
S1:S NL S1
|
S NL
;
S: INT L1 E
|
FLOAT L2 E
|
CHAR L3 E
|
DOUBLE L4 E
|
INT L1 E S
|
FLOAT L2 E S
| 
CHAR L3 E S
| 
DOUBLE L4 E S
|
| ABC E
;
L1:L1 C ID{strcpy(temp,(char *)$3); insert(0);}
|ID{strcpy(temp,(char *)$1); insert(0);}
;
L2:L2 C ID{strcpy(temp,(char *)$3); insert(1);}
|ID{strcpy(temp,(char *)$1); insert(1);}
;
L3:L3 C ID{strcpy(temp,(char *)$3); insert(2);}
|ID{strcpy(temp,(char *)$1); insert(2);}
;
L4:L4 C ID{strcpy(temp,(char *)$3); insert(3);}
|ID{strcpy(temp,(char *)$1); insert(3);}
;
E:SE
;
ABC : ID{ltyp=0;rtyp=0;ltyp=check($1);} EQ PRE {done();}
;
PRE : FLO {rtyp=1;}
| DEC {rtyp=(rtyp>0)?rtyp:0;}
| ID {summa=check($1);rtyp=(rtyp>0)?rtyp:summa;}
| PRE{} OP PRE
;
%%
void done(){
/*if(ltyp==rtyp)
printf("Assingment true\n");
else if(ltyp==0&&rtyp==1){
printf("float_to_int();\n");
}
else if(ltyp==2&&rtyp!=2){
printf("TYPE_CAST_ERR\n");
}
else{
printf("int_to_float();\n");
}
}
void yyerror(){}
int check(char *t){
for(j=0;j<i;j++){
if(strcmp(t,symbol[j])==0){
return type[j];
}
}
printf("%s not declared\n",t);
yyerror();
*/

printf("LD %c,R%d;\n",temp,cnt);
switch(*yytext)
{
case '+': printf("ADD R0,R0,R1\n");
 	  break;
case '-': printf("SUB R0,R0,R1\n");
          break;
case '*': printf("MUL R0,R0,R1\n");
          break;
case '/': printf("DIV R0,R0,R1\n");
          break;
}

printf("ST %c,R%d\n",temp,cnt);

}
void insert(int type1){
	fl=0;
	for(j=0;j<i;j++)
		if(strcmp(temp,symbol[j])==0){
			printf("***Already %s Stored in %d as type %s***\n",temp,addr[j],data[j]);
			fl=1;
		}
	if(fl==0){
		char st[100];
		if(type1==0){strcpy(data[i],"int\0");}
		else if(type1==1){strcpy(data[i],"float\0");}
		else if(type1==2){strcpy(data[i],"char\0");}
		addr[i]=1000+(i+1)*4;
		printf("%s - %d - %s\n",temp,addr[i],data[i]);
		type[i]=type1;
		strcpy(symbol[i],temp);
		i++;
	}
}

