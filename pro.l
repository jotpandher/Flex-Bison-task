%{
#include<iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}

digits			[0-9]+	
float			{digits}*"."{digits}	
text			[a-zA-Z]+
nodes			[\t]*[=]+{digits}
beamx			{text}+[=]+[[]+{digits}+
beamy			[\n]*[,]+{digits}+[]]

%%

[ \n]
x+{nodes}+	{ cout << ""	<< yytext	<< endl;}
y+{nodes}+	{cout << ""     << yytext 	<< endl;}
z+{nodes}+	{cout << ""  	<< yytext 	<< endl ;}
{beamx}+	{cout << " "      << yytext ;}
{beamy}+	{cout << "" 		<< yytext << endl;}
.							;
%%
main()
{
 	FILE *text= fopen("beam.flt", "r");
 	yyin = text; 
 	yylex();
}

