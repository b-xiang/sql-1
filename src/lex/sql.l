%{
#include "y.tab.h"
#include <math.h>
extern int yydebug;
%}

%%

create 						{ return CREATE; }
table 						{ return TABLE; }
insert 						{ return INSERT; }
into 							{ return INTO; }
select 						{ return SELECT; }
from 							{ return FROM; }
where 						{ return WHERE; }
primary 						{ return PRIMARY; }
foreign 						{ return FOREIGN; }
key 							{ return KEY; }
default 						{ return DEFAULT; }
check 						{ return CHECK; }
not 							{ return NOT; }
null 							{ return TOKEN_NULL; }
and 							{ return AND; }
or 							{ return OR; }
"!="                    { return NEQ; }
"<>"        				{ return NEQ; }
">="							{ return GEQ; }
"<=" 							{ return LEQ; }
references 					{ return REFERENCES; }
order 						{ return ORDER; }
by 							{ return BY; }
delete 						{ return DELETE; }
as 							{ return AS; }
int 							{ return INT; }
double 						{ return DOUBLE; }
char 							{ return CHAR; }
varchar 						{ return VARCHAR; }
text 							{ return TEXT; }
join 							{ return JOIN; }
inner 						{ return INNER; }
outer 						{ return OUTER; }
left 							{ return LEFT; }
right 						{ return RIGHT; }
natural 						{ return NATURAL; }
union 						{ return UNION; }
values 						{ return VALUES; }
auro 							{ return AUTO; }
increment 					{ return INCREMENT; }
asc 							{ return ASC; }
desc 							{ return DESC; }
unique                  { return UNIQUE; }
in                      { return IN; }
count                   { return COUNT; }
sum                     { return SUM; }
min                     { return MIN; }
max                     { return MAX; }
avg                     { return AVG; }
on                      { return ON; }
using                   { return USING; }
[a-zA-Z][a-zA-Z0-9_]*   { yylval.strval = strdup(yytext); 
                          if (yydebug) printf("lexed identifier '%s'\n", yytext); 
                          return IDENTIFIER; }
((\"[^\"]*\")|(\'[^\']*\')) 	{ yylval.strval = strdup(yytext); return STRING_LITERAL; }
[+-]?[0-9]+ 				{ yylval.ival = atoi(yytext); return INT_LITERAL; }
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)	{ yylval.dval = atof(yytext); return DOUBLE_LITERAL; }
[ \t\r\n]+                  { /* ignore */ }
.                       { if (yydebug) printf("lexed single character '%c'\n", yytext[0]); 
                          return yytext[0]; }

%%