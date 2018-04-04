username [a-zA-Z0-9]+
domain [a-z]+
tld [a-z]+
email {username}@{domain}\.{tld}[ \t\n]
%%
{email} printf("%s\n", yytext);
\n
.
%%
int main() {
        yylex();
        return 0;
}


