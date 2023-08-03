%{
#include <stdio.h>
#include "y.tab.h"    
%}
%option noyywrap
%%
[0-9]+ {yylval=atoi(yytext); return NUM;}
. return yytext[0];
\n return 0;

%%
