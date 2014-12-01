%{
#include "write.h"
#include <cstdio>
#include<iostream>
#include <fstream>
using namespace std;

extern "C" int yylex ();
extern "C" int yyparse (void);
extern "C" FILE *yyin;

void yyerror(const char *s);
#define YYDEBUG 1
//write_function s;
%}

%union{
	int  srnum;
	float xnodes;
	float ynodes;
	float znodes;
	float beamx;
	float beamy;
}
%token	<int> srnum;
%token <float>xnodes ynodes znodes;
%token  <float>beamx beamy;

%%

FELT:
	FELT srnum {cout<<$2<<endl;   } 
	|FELT xnodes {cout<<$2<<endl; }
	| FELT ynodes { cout<<$2<<endl; }
	| FELT znodes { cout<<$2<<endl;}
	| FELT beamx  { cout<< $2<<endl;}
	| FELT beamy  {cout <<$2 <<endl;}
	| srnum  { cout<<$1<<endl;}
	| xnodes  {cout<<$1<<endl;}
	| ynodes        { cout<<$1<<endl;}
	| znodes {cout<<$1<<endl;}
	|beamx{ cout<<""<<endl;}
	|beamy { cout<< ""<<endl;}

%%

main()
{

	 FILE *text= fopen("beam.flt", "r");
 	if (!text) {
		cout << "I can't open this file" << endl;
		return -1;
	}

        yyin = text; 


	do{

//	yydebug = 1;

	yyparse();
	} while (!feof(yyin));
//	s.write_end_function("*", 70);

}

void yyerror(const char *s) {
cout << "Parser error! Message: " << s << endl;
	exit(-1);
}


