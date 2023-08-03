%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyerror(char*);
    
    int count = 0;
%}

%token IDEN NUM IF ELSE 

%%
S : I
  ;
  
I : IF '(' C ')'  B	I {count++;}
  | ELSE I
  | ELSE B
  |
  ;

C : C '&''&' C
  | C '|''|' C
  | '!' C
  | '(' C ')'
  | E REL E
  | E
  ;

E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | IDEN
  | NUM
  ;

B : B B 
  | '{' B '}'
  | I
  | IDEN '=' E ';'
  |
  ;

REL : '>''='
    | '<''='
    | '!''='
    | '=''='
    | '>'
    | '<'
    ;

%%

int yyerror(char* mesg)
{
    printf("Invalid \n");
    exit(0);
}

int main()
{
    printf("Enter code snippet\n");
    yyparse();
    printf("Valid\n");
    printf("Count of if statements  = %d\n", count);
    return 0;
}
    
