%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

%%
"int" {return KEY;}
"float" {return KEY;}
"char" {return KEY;}
"double" {return KEY;}
"bool" {return KEY;}
[a-zA-Z][a-zA-Z0-9]* {printf("Identifier is %s\n", yytext); return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
# {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
    return 1;
}
