%{
%}


%%
[0-9]+ { yylval=atoi(yytext);  return ID; }
[-+*/] { return yytext[0]; }
. ;
\n yyterminate();
%% 
