letter [a-zA-z]
digit [0-9]
%{
int charcnt=0,linecnt=0,wordcnt=0,uppercase=0,lowercase=0,dig=0;
%}

%%
\t {wordcnt++;}
[(letter|digit)* ]+ {wordcnt++;}



. {charcnt++;}
\n {charcnt++;linecnt++;wordcnt++;}


%%

int main()
{
yylex();
printf("There were %d lines, %d words %d characters\n",linecnt,wordcnt,charcnt);
return 0;
}

