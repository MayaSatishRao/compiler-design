%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    int yyerror(char*);
    int count = 0;
%}

%token KEY IDEN NUM

%%

S : D ';' S
  |
  ;

D : D ',' I
  | T I
  ;

T : KEY
  ;

I : IDEN	{count++;}
  | IDEN C	{count++;}
  | IDEN '=' NUM {count++;}
  | IDEN C '=' '{' NUM '}' {count++;}
  ;

C : '[' NUM ']' C
  | 
  ;
%%

int main()
{
    printf("Enter variable declarations\n");
    yyparse();
    printf("Valid\n");
    printf("Count of identifiers = %d\n", count);
    return 0;
}

int yyerror(char* mesg)
{
    printf("Invalid\n");
    exit(0);
}
