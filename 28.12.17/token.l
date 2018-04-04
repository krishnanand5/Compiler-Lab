dig [0-9]
let [a-zA-Z]
%{
int id =0, num=0,space=0,op =0,assign=0,key=0;
%}

%%
("printf"|"main"|"int"|"char"|"float"|"if"|"else"|"switch"|"for"|"while") { key++;printf("%s is a keyword\n",yytext); }
([a-zA-Z]+[_](([a-zA-Z]+[_])|[0-9])*) { id++;printf("%s is an identifier\n",yytext);}
{dig}*([.]{dig}*)?([Ee][+-]?{dig}*)? { num++;printf("%d is a number\n",yytext);}
"=" {assign++;printf("%s is assignment operator\n",yytext); }
([*+-/]) {op++;printf("%s is an operator\n",yytext); }

[ \t\n]+ {space++;}
. {}
%%

int main(int argc, char* argv[])
{
int i=1;
for(i;i<argc;i++)
{
printf("Reading file i=%d\n",i);
if(yywrap()==1)
yyin=fopen(argv[i],"r");
yylex();
printf("There are %d identifiers, %d numbers, %d assignment operators, %d spaces %d keywords and %d operators\n",id,num,assign,space,key,op);
}
return 0;
}

