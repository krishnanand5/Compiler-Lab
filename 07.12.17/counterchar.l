letter [a-zA-z]
digit [0-9]
%{
int charcnt=0,linecnt=0,wordcnt=0,uppercase=0,lowercase=0,dig=0;
%}

%%
\t {wordcnt++;}
[(letter|digit)* ]+ {wordcnt++;}
[a-z] {charcnt++;lowercase++;}
[A-Z] {charcnt++;uppercase++;}
[0-9] {charcnt++;dig++;}
. {charcnt++;}
\n {charcnt++;linecnt++;wordcnt++;}


%%

int main()
{
yylex();
printf("There were %d lines, %d words,%d upper %d lower and %d digits and %d characters\n",linecnt,wordcnt,uppercase,lowercase,dig,charcnt);
return 0;
}

