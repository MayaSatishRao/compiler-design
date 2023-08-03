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

{posint}\/{posint}|{negint}\/{negint} pf++;
{posint}\/{negint}|{negint}\/{posint} nf++;

{posnum}\/{posnum}|{negnum}\/{negnum} pf++;
{posnum}\/{negnum}|{negnum}\/{posnum} nf++;

{posint}\/{posnum}|{negint}\/{negnum} pf++;
{posint}\/{negnum}|{negint}\/{posnum} nf++;

{posnum}\/{posint}|{negnum}\/{negint} pf++;
{posnum}\/{negint}|{negnum}\/{posint} nf++;

[\t ] ;
[\n] return 0;

%%

int main(){
    printf("Enter the numbers: \n");
    yylex();
    printf("pn=%d, nn=%d, pf=%d, nf=%d\n",pn,nn,pf,nf);
}
	
