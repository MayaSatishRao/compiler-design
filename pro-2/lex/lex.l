%{
#include <stdio.h>
int pn=0,nn=0,pf=0,nf=0;
%}

num [0-9]+
posint [\+]?{num}
negint [-]{num}

posnum {posint}?\.{num}
negnum {negint}\.{num}|-\.{num}


%option noyywrap
%%
{posint} pn++;
{negint} nn++;

{posnum} pf++;
{negnum} nf++;

({posnum}|{posint})\/({posnum}|{posint})|({negnum}|{negint})\/({negnum}|{negint}) pf++;
({posnum}|{negint})\/({posnum}|{negint})|({negnum}|{posint})\/({negnum}|{posint}) pf++;


[\t ] ;
[\n] return 0;

%%

int main(){
    printf("Enter the numbers: \n");
    yylex();
    printf("pn=%d, nn=%d, pf=%d, nf=%d\n",pn,nn,pf,nf);
}
	
