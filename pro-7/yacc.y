%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror(char*);
%}

%token KEY IDEN RET NUM

%%
S : I	
  ;

I : KEY IDEN '(' A ')' '{' B '}'
  ;

A : KEY IDEN ',' A
  | KEY IDEN
  |
  ;
  
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | IDEN
  | NUM
  ;

B : IDEN '=' E ';' B
  | IDEN '=' E ';'
  | RET E ';'
  | RET NUM ';'
  |RET IDEN ';'
  |
  ;
%%

int main() {
    printf("Enter the function definition\n");
    yyparse();
    printf("Valid function definition\n");
    return 0;
}

int yyerror(char* mesg) {
    printf("Invalid function definition\n");
    exit(0);
}
