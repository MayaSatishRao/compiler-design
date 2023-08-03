%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern FILE* yyin;
    extern int yylex();
    int yyerror(char*);
    
    typedef char* string;
    
    struct
    {
    	string res;
    	string op1;
    	string op2;
    	char op;
    }code[100];
    
    int idx = -1,i=0;
    
    string addToTable(string, string, char);
    void printMachineCode();
%}

%union
{
   char* exp;
}

%token <exp> IDEN NUM
%type <exp> EXP
%left '+' '-'
%left '*' '/'

%%
STMTS : STMTS STMT
      |
      ;

STMT : EXP '\n'
     ;
     
EXP : EXP '+' EXP {$$ = addToTable($1, $3, '+');}
    | EXP '-' EXP {$$ = addToTable($1, $3, '-');}
    | EXP '*' EXP {$$ = addToTable($1, $3, '*');}
    | EXP '/' EXP {$$ = addToTable($1, $3, '/');}
    | IDEN '=' EXP {$$ = addToTable($1, $3, '=');}
    | '(' EXP ')' {$$ = $2;}
    | IDEN {$$ = $1;}
    | NUM {$$ = $1;}
    ;
%%

int yyerror(char* mesg)
{
    printf("Invalid\n");
    exit(0);
}

int main()
{
    yyin = fopen("foo.txt", "r");
    yyparse();
        
    printf("Machine Code\n");
    printMachineCode();
    
    return 0;
}

string addToTable(string op1, string op2, char op)
{
    idx++;
    if (op == '=')
    {
    	code[idx].res = op1;
    	code[idx].op1 = op2;
    	code[idx].op = op;
    	return op1;
    }
    
    string res = malloc(3);
    sprintf(res, "@ %c", idx + 'A');
    code[idx].res = res;
    code[idx].op1 = op1;
    code[idx].op2 = op2;
    code[idx].op = op;
    return res;
}

void printMachineCode() 
{
    for (i = 0; i <= idx; i++)
    {
    	char op = code[i].op;
    	
    	if (op == '=')
    	{
    	    printf("LD R1, %s\n", code[i].op1);
    	    printf("ST %s, R1\n", code[i].res);
	}
	else
	{
	    string inst;
	
    	    if (op == '+')
    	       inst = "ADD";
    	    else if (op == '-')
    	       inst = "SUB";
    	    else if (op == '*')
    	       inst = "MUL";
    	    else if (op == '/')
    	       inst = "DIV";
    	
    	    printf("LD R1, %s\n", code[i].op1);
    	    printf("LD R2, %s\n", code[i].op2);
    	    printf("%s R3, R1, R2\n", inst);
    	    printf("ST %s, R3\n", code[i].res);
    	}
    }
}
