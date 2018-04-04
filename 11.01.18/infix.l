%{	
	#include<stdio.h>
	char* a="no";
	char stack[100];
	int top_of_stack=0;
	void push(char);
	void pop();
    char peek();
    int pri(char c);
%}
%%
[a-zA-Z0-9]+ {printf("%c",yytext[0]);}
[+\-\*\/\(\)] { char operator=yytext[0];
                 if(top_of_stack==0||operator=='(')
                 push(operator);
                 else if(operator==')'){
                   while(peek()!='('){
                    printf("%c",peek());
                    pop();
                    }
                    pop();
                 }
                   
                 else if(pri(operator)>=pri(peek())){
                  push(operator);
                  }
                  else if(pri(operator)<=pri(peek())){
                    while(pri(operator)<=pri(peek())){
                       printf("%c",peek());
                       pop();
                       }
                       push(operator);
                  }
              }
 [\n]  {
          int i;
             for(i=top_of_stack-1;i>=0;i--)
                 if(stack[i]!='('&&stack[i]!=')'){
                    printf("%c",stack[i]);
                  
                    }
          printf("\n");
          top_of_stack=0;   
                
            
       }
           
%%
int yywrap()
{
 if(strcmp(a,"no")==0)
 {
 yyin=fopen("test1.txt","r");
 a="fds";
 return 0;
 }
else
{
 return 1;
}
}
int main(int argc,char *argv[])
{
int i;
for(i=1;i<argc;i++){
yyin=fopen(argv[i],"r");
yylex();
}
return 0;
}




void pop(){
 top_of_stack--;
}
 char peek(){
   return stack[top_of_stack-1];
}
  
void push(char c){
   stack[top_of_stack]=c;
   top_of_stack++;
}
int pri(char c){
switch(c){
case '(':return 0;
case ')':return 0;
case '+':return 1;
case '-':return 1;
case '*':return 2;
case '/':return 2;
}
}
