%{
int charcnt=0,linecnt=0;
%}

%%


\n {linecnt++;}

%%

int main()
{
yylex();
printf("There were %d lines\n",linecnt);
return 0;
}

