%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

%%
"int" {return KEY;}
"float" {return KEY;}
"double" {return KEY;}
"bool" {return KEY;}
"void" {return KEY;}
"return" {return RET;}
[a-zA-Z][a-zA-Z0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[ \n] ;
# {return 0;}
. return yytext[0];
%%

int yywrap() {
    return 0;
}
