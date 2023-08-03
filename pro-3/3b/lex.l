%{

	#include "y.tab.h"
%}
%option noyywrap
%%
"for" return FOR;
[a-zA-Z]* return IDEN;
[0-9]+ return NUM;
[\t ]  ;
\n return 0;
.   return yytext[0];
%%
