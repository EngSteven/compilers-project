%%
%class Lexer
%type Tokens
%state STRING


L=[a-zA-Z_]+
space=[ ,\t,\r]+
reserved=auto|break|case|char|const|continue|default|do|double|else|
enum|extern|float|for|goto|if|int|long|register|return|short|signed|
sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
id=[a-zA-Z_][a-zA-Z_0-9]*
intNumber=[0-9]+
string = \"([^\"\\\n]|\\.)*\"
char='([^'\\]|\\[nrt0'\\])'       
charNumber=\#[0-9]+
decimalNumber=(0|([1-9][0-9]*))([uU]?[lL]{1,2}|[lL]{1,2}[uU]?|[uU])?     // [uU] -> unsigned  [lL] -> long
octalNumber=(0[0-7]+)([uU]?[lL]{1,2}|[lL]{1,2}[uU]?|[uU])?               // [uU] -> unsigned  [lL] -> long
hexadecimalNumber=0[xX][0-9a-fA-F]+
floatNumber=[0-9]+\.[0-9]+
floatExpNumber=[eE][+-]?[0-9]+

%{
    public String lexeme;
     // Variable para llevar la cuenta de las líneas
    private int lineNumber = 1;

    // Método para obtener el número de línea actual
    public int getLineNumber() {
        return lineNumber;
    }

%}
%%

\n         { lineNumber++; }  // Incrementa el contador de líneas al encontrar un salto de línea

"//".* {/*Ignore*/}
"/*"([^*]|\*+[^/*])*"*/" { lineNumber += (yytext().split("\n").length - 1); /*Ignore*/}     // comentarios en bloque
{space} {/*Ignore*/}
{reserved} {lexeme=yytext(); return Tokens.Reservadas;}
"," {lexeme=yytext(); return Tokens.Operadores;}
";" {lexeme=yytext(); return Tokens.Operadores;}
"+" {lexeme=yytext(); return Tokens.Operadores;}
"-" {lexeme=yytext(); return Tokens.Operadores;}
"*" {lexeme=yytext(); return Tokens.Operadores;}
"/" {lexeme=yytext(); return Tokens.Operadores;}
"%" {lexeme=yytext(); return Tokens.Operadores;}
"++" {lexeme=yytext(); return Tokens.Operadores;}
"--" {lexeme=yytext(); return Tokens.Operadores;}
"==" {lexeme=yytext(); return Tokens.Operadores;}
">=" {lexeme=yytext(); return Tokens.Operadores;}
">" {lexeme=yytext(); return Tokens.Operadores;}
"<=" {lexeme=yytext(); return Tokens.Operadores;}
"<" {lexeme=yytext(); return Tokens.Operadores;}
"!=" {lexeme=yytext(); return Tokens.Operadores;}
"||" {lexeme=yytext(); return Tokens.Operadores;}
"&&" {lexeme=yytext(); return Tokens.Operadores;}
"!" {lexeme=yytext(); return Tokens.Operadores;}
"?" {lexeme=yytext(); return Tokens.Operadores;}
"=" {lexeme=yytext(); return Tokens.Operadores;}
"(" {lexeme=yytext(); return Tokens.Operadores;}
")" {lexeme=yytext(); return Tokens.Operadores;}
"[" {lexeme=yytext(); return Tokens.Operadores;}
"]" {lexeme=yytext(); return Tokens.Operadores;}
"{" {lexeme=yytext(); return Tokens.Operadores;}
"}" {lexeme=yytext(); return Tokens.Operadores;}
":" {lexeme=yytext(); return Tokens.Operadores;}
"." {lexeme=yytext(); return Tokens.Operadores;}
"+=" {lexeme=yytext(); return Tokens.Operadores;}
"-=" {lexeme=yytext(); return Tokens.Operadores;}
"*=" {lexeme=yytext(); return Tokens.Operadores;}
"/=" {lexeme=yytext(); return Tokens.Operadores;}
"&" {lexeme=yytext(); return Tokens.Operadores;}
"^" {lexeme=yytext(); return Tokens.Operadores;}
"|" {lexeme=yytext(); return Tokens.Operadores;}
">>" {lexeme=yytext(); return Tokens.Operadores;}
"<<" {lexeme=yytext(); return Tokens.Operadores;}
"~" {lexeme=yytext(); return Tokens.Operadores;}
"%=" {lexeme=yytext(); return Tokens.Operadores;}
"&=" {lexeme=yytext(); return Tokens.Operadores;}
"^=" {lexeme=yytext(); return Tokens.Operadores;}
"|=" {lexeme=yytext(); return Tokens.Operadores;}
"<<=" {lexeme=yytext(); return Tokens.Operadores;}
">>=" {lexeme=yytext(); return Tokens.Operadores;}
"->" {lexeme=yytext(); return Tokens.Operadores;}
{id} {lexeme=yytext(); return Tokens.Identificadores;}
{decimalNumber} {lexeme=yytext(); return Tokens.Decimales;}
{octalNumber} {lexeme=yytext(); return Tokens.Octales;}
{hexadecimalNumber} {lexeme=yytext(); return Tokens.Hexadecimales;}
({floatNumber}) {lexeme=yytext(); return Tokens.Flotantes;}
({floatNumber}{floatExpNumber}) {lexeme=yytext(); return Tokens.FlotantesExpenciales;}

({string}) {lexeme=yytext(); return Tokens.Strings;}
({char}) {lexeme=yytext(); return Tokens.Caracteres;}
({charNumber}) {lexeme=yytext(); return Tokens.CaracteresNumericos;}


//Errores

\"([^\"\\n])*[\n] { lexeme = yytext(); return Tokens.ERROR_STRING_NO_CERRADO; }

{intNumber}{id} { lexeme = yytext(); return Tokens.ERROR_IDENTIFICADOR_INVALIDO; }  // Identificador no válido

\.[0-9]+ { lexeme = yytext(); return Tokens.ERROR_NUMERO_MAL_FORMADO; }  // Número mal construido

\'([^'\\n]|\\[^nrt0])* { lexeme = yytext(); return Tokens.ERROR_CARACTER_NO_CERRADO; }

\'\\[^nrt0] { lexeme = yytext(); return Tokens.ERROR_CARACTER_MAL_FORMADO; }

// Error de strings con salto de línea
\"([^\"\\\n]|\\.)*\n { lexeme = yytext(); return Tokens.ERROR_SALTO_LINEA; }

// Error flotante que no tiene nada antes del punto
\.{intNumber}+ {lexeme=yytext(); return Tokens.ERROR;}

// Error notación científica que no tiene nada después de la e
(-?)[0-9].[0-9][0-9]*E+$ {lexeme=yytext(); return Tokens.ERROR;}

// Error notación científica sin nada después del punto
(-?)[0-9].E(-?)[1-9][0-9]* {lexeme=yytext(); return Tokens.ERROR;}

// Error notación científica de punto después de la E
(-?)[0-9].[0-9][0-9]*E(-?)[1-9]\.[0-9]* {lexeme=yytext(); return Tokens.ERROR;}

// Error flotante que no tiene nada después del punto
{intNumber}*\. {lexeme=yytext(); return Tokens.ERROR;}

{id} {
    lexeme=yytext();
    if (lexeme.length() < 128){
        return Tokens.Identificadores;
    }
    return Tokens.ERROR;
}

 . {lexeme=yytext(); return Tokens.ERROR;}