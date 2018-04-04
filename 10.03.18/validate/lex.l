%{
	#include<stdio.h>
	#include"y.tab.h"
%}

identifier	[a-zA-Z_][a-zA-Z0-9_]*
number	[-+]?[0-9]+

%%
for	{
	return FOR;
}
while	{
	return WHILE;
}
if	{
	return IF;
}
else	{
	return ELSE;
}
{identifier}	{
	return ID;
}
{number}	{
	yylval = atoi(yytext);
	return NUM;
}
[-+/*=]	{
	return OP;
}
("++"|"--")	{
	return ITR;
}
(>|<|"<="|">="|"=="|"!=")	{
	return RELOP;
}
("&&"|"||")	{
	return LOGOP;
}
[{()}]	{
	return *yytext;
}
";"	{
	return END;
}
[\n\t ]	
%%
