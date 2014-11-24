%{
#include <cstdio>
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

%token xnodes ynodes znodes;
%token  beamx beamy;

%%

FELT:
	FELT xnodes {cout<<"jot"<<endl; }
	| FELT ynodes { cout<<""<<endl; }
	| FELT znodes { cout<<""<<endl;}
	| FELT beamx  { cout<< ""<<endl;}
	| FELT beamy  {cout <<"" <<endl;}
	| xnodes  { cout<< ""<<endl;}
	| ynodes        { cout<<""<<endl;}
	| znodes {cout<<""<<endl;}
	|beamx{ cout<<""<<endl;}
	|beamy { cout<< ""<<endl;}

%%

main()
{
 FILE *text= fopen("beam.flt", "r");
 	if (!text) {
		cout << "I can't open a.snazzle.file!" << endl;
		return -1;
	}

        yyin = text; 


	do{
//		yydebug = 1;
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s) {
cout << "Parser error! Message: " << s << endl;
	exit(-1);
}


