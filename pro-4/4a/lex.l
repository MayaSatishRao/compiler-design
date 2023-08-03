%{
    #include<stdio.h>
    int id=0,key=0,op=0;
%}

%option noyywrap
%%
\"[^\n]+\"|"\\"[^\n]+|"/*"[^\n]+"*/" ;
"int"|"char"|"float"|"double"|"if"|"else"|"for"|"while"|"exit"|"return"|"include" key++;
[a-zA-Z_][a-zA-Z0-9_]*  id++;
"++"|"--"|"&&"|"||"|[\+\-\*\/\^\!\|\&\%\<\>\=]"=" op++;
[\+\-\*\/\%\^\&\|\!\=]  op++;
.  ;
\n ;
%%


int main()
{
    yyin = fopen("sample.c","r");
    yylex();
    printf("Identifiers: %d\nKeywords: %d\nOperators: %d\n",id,key,op);
    return 0;
}
