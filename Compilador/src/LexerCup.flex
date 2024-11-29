import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%state STRING
%cup 
%full 
%line 
%column

L=[a-zA-Z_]+
space=[ \t\r\n]+ 
id=[a-zA-Z_][a-zA-Z_0-9]*
char='([^'\\]|\\[nrt0'\\])' 
intNumber = [0-9]+

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%


"//".* {/*Ignore*/}
"/*"([^*]|\*+[^/*])*"*/" { /*Ignore*/}     // comentarios en bloque
{space} {/*Ignore*/}
int {return new Symbol (sym.Int, yycolumn, yyline, yytext());}
long {return new Symbol (sym.Long, yycolumn, yyline, yytext());}
short {return new Symbol (sym.Short, yycolumn, yyline, yytext());}
char {return new Symbol (sym.Char, yycolumn, yyline, yytext());}
const {return new Symbol (sym.Const, yycolumn, yyline, yytext());}
void {return new Symbol (sym.Void, yycolumn, yyline, yytext());}
if {return new Symbol (sym.If, yycolumn, yyline, yytext());}
else {return new Symbol (sym.Else, yycolumn, yyline, yytext());}
for {return new Symbol (sym.For, yycolumn, yyline, yytext());}
while {return new Symbol (sym.While, yycolumn, yyline, yytext());}
switch {return new Symbol (sym.Switch, yycolumn, yyline, yytext());}
case {return new Symbol (sym.Case, yycolumn, yyline, yytext());}
default {return new Symbol (sym.Default, yycolumn, yyline, yytext());}
break {return new Symbol (sym.Break, yycolumn, yyline, yytext());}
read {return new Symbol (sym.Read, yycolumn, yyline, yytext());}
write {return new Symbol (sym.Write, yycolumn, yyline, yytext());}
return {return new Symbol (sym.Return, yycolumn, yyline, yytext());}
do {return new Symbol (sym.Do, yycolumn, yyline, yytext());}
continue {return new Symbol (sym.Continue, yycolumn, yyline, yytext());}
{id} {return new Symbol (sym.Identificador, yycolumn, yyline, yytext());}
"=" {return new Symbol (sym.Igual, yycolumn, yyline, yytext());}
"+=" {return new Symbol (sym.Sum_Igual, yycolumn, yyline, yytext());}
"-=" {return new Symbol (sym.Res_Igual, yycolumn, yyline, yytext());}
"*=" {return new Symbol (sym.Mul_Igual, yycolumn, yyline, yytext());}
"/=" {return new Symbol (sym.Div_Igual, yycolumn, yyline, yytext());}
"++" {return new Symbol (sym.Incremento, yycolumn, yyline, yytext());}
"--" {return new Symbol (sym.Decremento, yycolumn, yyline, yytext());}
"+" {return new Symbol (sym.Sum, yycolumn, yyline, yytext());}
"-" {return new Symbol (sym.Res, yycolumn, yyline, yytext());}
"*" {return new Symbol (sym.Mul, yycolumn, yyline, yytext());}
"/" {return new Symbol (sym.Div, yycolumn, yyline, yytext());}
"%" {return new Symbol (sym.Mod, yycolumn, yyline, yytext());}
"(" {return new Symbol (sym.P_Abierto, yycolumn, yyline, yytext());}
")" {return new Symbol (sym.P_Cerrado, yycolumn, yyline, yytext());}
";" {return new Symbol (sym.PuntoYComa, yycolumn, yyline, yytext());}
"," {return new Symbol (sym.Coma, yycolumn, yyline, yytext());}
"{" {return new Symbol (sym.Llave_Abierta, yycolumn, yyline, yytext());}
"}" {return new Symbol (sym.Llave_Cerrada, yycolumn, yyline, yytext());}
"==" {return new Symbol (sym.Igual_Igual, yycolumn, yyline, yytext());}
">=" {return new Symbol (sym.Mayor_Igual, yycolumn, yyline, yytext());}
">" {return new Symbol (sym.Mayor, yycolumn, yyline, yytext());}
"<=" {return new Symbol (sym.Menor_Igual, yycolumn, yyline, yytext());}
"<" {return new Symbol (sym.Menor, yycolumn, yyline, yytext());}
"!=" {return new Symbol (sym.Diferente, yycolumn, yyline, yytext());}
"||" {return new Symbol (sym.Or, yycolumn, yyline, yytext());}
"&&" {return new Symbol (sym.And, yycolumn, yyline, yytext());}
"!" {return new Symbol (sym.Not, yycolumn, yyline, yytext());}
":" {return new Symbol (sym.DosPuntos, yycolumn, yyline, yytext());}



{intNumber} {return new Symbol (sym.Entero, yycolumn, yyline, yytext());}
{char} {return new Symbol (sym.Caracter, yycolumn, yyline, yytext());}
. {return new Symbol (sym.Error, yycolumn, yyline, yytext());}