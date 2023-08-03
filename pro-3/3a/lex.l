%{
	#include<stdio.h>
	int single=0,multi=0,mlines=0,i=0;
%}

sentence [^\n]+
%%
\"{sentence}\" fprintf(yyout,yytext);
"//"{sentence}	{single++;}
"/*"({sentence}|[\n])+"*/"	{
	multi++;
	for(i=0;i<yyleng;i++)
	{
		if(yytext[i]=='\n')
			mlines++;
	}
}

. fprintf(yyout,yytext);
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("sample.c","r");
	yyout=fopen("out.txt","w");
	yylex();
	printf("Single: %d\n Multi: %d\nMlines: %d\n",single,multi,mlines);
	return 0;
}
