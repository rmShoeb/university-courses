%{
/*** Auxiliary declarations section ***/

#include<stdio.h>
#include<stdlib.h>

/* Custom function to print an operator*/
void print_operator(char op);

/* Variable to keep track of the position of the number in the input */
int pos=0;
%}

/*** YACC Declarations section ***/
%token DIGIT
%left '+' // %left option is used to resolve shift/reduce conflicts
%left '*' // it means the operator is left associative

%%
/*** Rules Section ***/
start: expr '\n'		{printf("\n");exit(1);}
    ;

expr: expr '+' expr     {print_operator('+');}
    | expr '*' expr     {print_operator('*');}
    | '(' expr ')'
    | DIGIT             {printf("NUM%d ",pos);}
    // | DIGIT DIGIT       {printf("huh\n");} // this works!
    ;
%%


/*** Auxiliary functions section ***/

void print_operator(char c){
    switch(c){
        case '+'  : printf("PLUS ");
                    break;
        case '*'  : printf("MUL ");
                    break;
    }
    return;
}

yyerror(char const *s)
{
    printf("yyerror %s",s);
}

yylex(){
    char c;
    c = getchar();
    if(isdigit(c)){
        pos++;
        return DIGIT;
    }
    else if(c == ' '){
        yylex();         /*This is to ignore whitespaces in the input*/
    }
    else {
        return c;
    }
}

main()
{
	yyparse();
	return 1;
}
// http://silcnitc.github.io/yacc.html
// http://silcnitc.github.io/lex.html