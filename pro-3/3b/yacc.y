%{
    #include <stdio.h>
    #include <stdlib.h>
    int count=0;
%}

%token FOR NUM IDEN 
%%

S:I 
   ;
I:FOR A B {count++;}
   ;
A:'('E';'E';'E')' 
   ;
B:B B
   |I
   |'{'B'}'
   |E
   |
   ;
E:IDEN Z IDEN
 |IDEN Z NUM
 |IDEN U
 |IDEN
  ;
Z: '<'| '<''=' | '>' | '>''=' | '=''=' | '=' | '!''='| '+''=' | '-''='
  ;
U: '+''+' | '+''-'
  ;
%%
int main(){
    printf("Enter the code snippet: \n");
    yyparse();
    printf("for loop count is: %d\n",count);
}

int yyerror(){
    exit(0);
}
