%{
    #include <stdio.h>
    #include "y.tab.h"
%}
%option noyywrap
%%
"if" return IF;
"else" return ELSE;
[a-zA-Z_][a-zA-Z_0-9]* return IDEN;
[0-9]+ return NUM;
[\t ]+ ;
\n return 0;
. return yytext[0];
%%
