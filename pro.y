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
write_function s;
%}

%union{
	int  srnum;
	float xnodes;
	float ynodes;
	float znodes;
	float beamx;
	float beamy;
}
%token	srnum;
%token xnodes ynodes znodes;
%token  beamx beamy;

%%

FELT:
	FELT srnum {cout<<"jot"<<endl;   } 
	|FELT xnodes {s.writeFeltFile_Joint_coordinates(float, char);}

	| FELT ynodes { cout<<""<<endl; }
	| FELT znodes { cout<<""<<endl;}
	| FELT beamx  { cout<< ""<<endl;}
	| FELT beamy  {cout <<"" <<endl;}
	| srnum  { cout<<" "<<endl;}
	| xnodes  {s.writeFeltFile_Joint_coordinates(float, char);}
	| ynodes        { cout<<""<<endl;}
	| znodes {cout<<""<<endl;}
	|beamx{ cout<<""<<endl;}
	|beamy { cout<< ""<<endl;}

%%

main()
{	string file_name, input_file;
	cout<<" Enter the name of input file:\n";
	cin>>file_name;

	 FILE *text= fopen(input_file.c_str(), "r");
 	if (!text) {
		cout << "I can't open this file" << endl;
		return -1;
	}

        yyin = text; 


	do{
<<<<<<< HEAD
//	yydebug = 1;
=======
//		yydebug = 1;
>>>>>>> 1f00b64ea815ee8d2e16b928b8cb8f4c458f568e
		yyparse();
	} while (!feof(yyin));
 	s.write_end_function("*", 70);

}

void yyerror(const char *s) {
cout << "Parser error! Message: " << s << endl;
	exit(-1);
}


