%{
#include<iostream>
#include <fstream>
using namespace std;

extern "C" int yylex ();
extern "C" int yyparse (void);
extern "C" FILE *yyin;

void yyerror(const char *s);
#define YYDEBUG 1
%}

%union{
	float xnodes;
	float ynodes;
	float znodes;
	float beamx;
	float beamy;
}

%token <nodes> xnodes ynodes znodes;
%token <beam elements> beamx beamy;

%%

FELT:
	FELT xnodes {cout<<"jot"<<endl; }
	| FELT ynodes { cout<<""<<endl; }
	| FELT znodes { cout<<""<<endl;}
	| FELT beamx  { cout<< ""<<endl;}
	| FELT beamy  {cout <<"" <<endl;}
	| xnodes { cout<< ""<<endl;}
	| ynodes { cout<<""<<endl;}
	| znodes {cout<<""<<endl;}
	|beamx{ cout<<""<<endl;}
	|beamy { cout<< ""<<endl;}

%%

int main()
{
 FILE *text= fopen("beam.flt", "r");
 	yyin = text; 
 	yylex();
}

	do{
//		yydebug = 1;
		yyparse();
	} 

void yyerror(const char *s) {
cout << "Parser error! Message: " << s << endl;
	exit(-1);
}


