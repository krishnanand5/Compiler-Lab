dig [0-9]
let [a-zA-Z]
%{

int relop=0,key=0,letters=0,spchar=0,constants=0,str=0;
%}

%%
("//".*) {}
"/*"(.|\n)*(\"(.|\n)*"*/"(.|\n)*\")?(.|\n)*"*/" {}
("printf"|"main"|"int"|"char"|"float"|"if"|"else"|"switch"|"for"|"while"|"real"|"then") { key++;printf("%s is a keyword\n",yytext); }
([a-zA-Z]) { letters++;printf("%s is a letter\n",yytext);}
([0-9]+) { constants++;printf("%d is a constant\n",yytext);}
("<="|"<"|">"|"<="|"<>"|"=") {relop++;printf("%s is relational operator\n",yytext); }
("!"|"@"|"#"|"$"|"%"|"^"|"&"|"*"|"("|")") { spchar++;printf("%s is a special character\n",yytext); }
(\".*\") {str++;printf("%s is a string\n",yytext);}

[ \t\n]+ {;}
. {}
%%

int main(int argc, char* argv[])
{
int i=1;
for(i;i<argc;i++)
{
printf("Reading file i=%d\n",i);
yyin=fopen(argv[i],"r");
yylex();
printf("There are %d keywords, %d relational operators, %d letters, %d special characters %d constants and %d strings\n",key,relop,letters,spchar,constants,str);
}
return 0;
}

