%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token NUM
%left '+''-'
%left '/''*'
%%
S: E {printf("Valid Expression and its value is %d\n",$$);}
E: E'+'E {$$ = $1+$3;}
 | E'-'E {$$ = $1-$3;}
 | E'*'E {$$ = $1*$3;}
 | E'/'E {if($3==0)
            yyerror();
          $$ = $1/$3;}
 |'('E')' {$$ = $2;}
 | NUM {$$ =$1;}
 | '-'NUM {$$ = -$2;}
 ;
%%

int main(){
    printf("Enter a valid expression:\n");
    yyparse();
}

int yyerror(){
    printf("Invlid expression\n");
    exit(0);
}
