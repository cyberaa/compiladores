%{
	#include <stdio.h>
	#include <string.h>
	int lines=1;
	char comment[1000];
	char ident[256];
	char atrib[200];
	char num_inteiro[50];
	char num_float[50];
	char num_char[50];
	char num_string[300];
	char num_boolean[10];
	int i=0;
%}


digitos [0-9]+ 
expoente [eE]-?{digitos}
expoente_positivo [eE]{digitos}

inteiro {digitos}+{expoente_positivo}?
fracao "."{digitos}
float {digitos}{fracao}?{expoente}?
comentario_linha "//"[^\n]*
comentario_bloco "/""*"+([^*/][^*]*"*"+)*"/"



%%

auto {return token_auto;}
break {return token_break;}
bool {strcat(atrib,yytext); strcat(atrib," ");return token_bool;}
case {return token_case;}
char {strcat(atrib,yytext); strcat(atrib," ");return token_char;}
const {return token_const;}
continue {return token_continue;}
default {return token_default;}
do {return token_do;}
double {strcat(atrib,yytext); strcat(atrib," ");return token_double;}
else {return token_else;}
enum {return token_enum;}
extern {return token_extern;}
float {strcat(atrib,yytext); strcat(atrib," ");return token_float;}
for {return token_for;}
goto {return token_goto;}
if {return token_if;}
int {strcat(atrib,yytext); strcat(atrib," "); return token_int;}
include {return token_include;}
long {strcat(atrib,yytext); strcat(atrib," "); return token_long;}
register {return token_register;}
return {return token_return;}
short {return token_short;}
signed {return token_signed;}
sizeof {return token_sizeof;}
static {return token_static;}
struct {return token_struct;}
switch {return token_switch;}
typedef {return token_typedef;}
union {return token_union;}
unsigned {return token_unsigned;}
void {strcat(atrib,yytext); strcat(atrib," "); return token_void;}
volatile {return token_volatile;}
while {return token_while;}
string {strcat(atrib,yytext); strcat(atrib," "); return token_stringtype;}

"int main" {return token_int_main;}

true {strcpy(num_boolean,yytext); return token_true;}
false {strcpy(num_boolean,yytext); return token_false;}

{comentario_linha} 
{comentario_bloco} {
	strcpy(comment,yytext);	
	for(i=0; i<strlen(comment); i++) {
		if(comment[i] == '\n') lines++;
	}
}

{inteiro} {strcpy(num_inteiro,yytext); return token_num_inteiro;}
{float} {strcpy(num_float,yytext);return token_num_float;}

"+" {return token_mais;}
"-" {return token_menos;}
"*" {return token_vezes;}
"/" {return token_divisao;}
"%" {return token_mod;}
"++" {return token_maismais;}
"--" {return token_menosmenos;}
">>" {return token_shiftdireita;}
"<<" {return token_shiftesquerda;}

">" {return token_maior;}
"<" {return token_menor;}
">=" {return token_maiorigual;}
"<=" {return token_menorigual;}
"==" {return token_igualigual;}
"!=" {return token_diferente;}

"=" {strcat(atrib," "); strcat(atrib,yytext);return token_igual;}
"+=" {strcat(atrib," ");strcat(atrib,yytext);return token_maisigual;}
"-=" {strcat(atrib," ");strcat(atrib,yytext);return token_menosigual;}
"*=" {strcat(atrib," ");strcat(atrib,yytext);return token_vezesigual;}
"/=" {strcat(atrib," ");strcat(atrib,yytext);return token_divisaoigual;}
"&=" {strcat(atrib," ");strcat(atrib,yytext);return token_ecomigual;}
"^=" {strcat(atrib," ");strcat(atrib,yytext);return token_xnorigual;}
"|=" {strcat(atrib," ");strcat(atrib,yytext);return token_ouigual;}
">>=" {strcat(atrib," ");strcat(atrib,yytext);return token_shiftesquerdaigual;}
"<<=" {strcat(atrib," ");strcat(atrib,yytext);return token_shiftdireitaigual;}



"(" {strcat(atrib,yytext);return token_abrep;}
")" {strcat(atrib,yytext);return token_fechap;}
"[" {return token_abrecol;}
"]" {return token_fechacol;}
"," {strcat(atrib,yytext); return token_virgula;}
";" {strcat(atrib,yytext); return token_ptevirgula;}
":" {return token_doispontos;}
"{" {return token_abrec;}
"}" {return token_fechac;}
"#" {return token_tralha;}
"'" {return token_aspa_simples;}
"\"" {return token_aspas;}
"\\" {return token_contra_barra;}
"." {return token_ponto;}

"&&" {return token_ecomecom;}
"&" {return token_ecom;}
"||" {return token_ou;}
"|" {return token_ou_bitbit;}
"^" {return token_chapeuzinho;}
"!" {return token_exclamacao;}

'[a-zA-Z0-9 !.,@;/\[\]()#$%^&*_\-+=\\'\"\?~<>:|{}]' {strcpy(num_char,yytext); return token_letra;}
\"[^\n]*\" {strcpy(num_string,yytext);return token_string;}
[_a-zA-Z][_a-zA-Z0-9]*	{strcat(atrib,yytext); strcpy(ident,yytext); return token_ident;}


\n {lines++;}
[ \t] 
. {}

%%
