

/* --------------------------Usercode Section------------------------ */
package src;
import java_cup.runtime.*;

%%

/* -----------------Options and Declarations Section----------------- */

/*
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java.
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column

/*
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup

/*
  Declarations

  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.
*/
%{
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


/*
  Macro Declarations

  These declarations are regular expressions that will be used latter
  in the Lexical Rules Section.
*/

/* A line terminator is a \r (carriage return), \n (line feed), or \r\n. */

LineTerminator = \r|\n|\r\n

/* White space is a line terminator, space, tab, or line feed. */

WhiteSpace     = {LineTerminator} | [ \t\f]

/* A literal integer is is a number beginning with a number between
   one and nine followed by zero or more numbers between zero and nine
   or just a zero.  */

int = 0 | [1-9][0-9]*
num = {int}("."[0-9]+)?


%%
/* ------------------------Lexical Rules Section---------------------- */

/*
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner matches the associated
   regular expression. */


    "+"        { System.out.print("<PLUS>"); return symbol(sym.PLUS); }
    "-"        { System.out.print("<MINUS>"); return symbol(sym.MINUS); }
    "~"        { System.out.print("<UNARY>"); return symbol(sym.UNARY); }
    "*"        { System.out.print("<TIMES>"); return symbol(sym.TIMES); }
    "^"        { System.out.print("<NEW>"); return symbol(sym.NEW); }
    "/"        { System.out.print("<DIVIDE>"); return symbol(sym.DIVIDE); } 
    "("        { System.out.print("<LPAREN>"); return symbol(sym.LPAREN); } 
    ")"        { System.out.print("<RPAREN>"); return symbol(sym.RPAREN); } 

    {num}      { System.out.print("<NUM," + yytext() + ">");return symbol(sym.NUMBER, new Double(yytext())); }

    /* Don't do anything if whitespace is found */

    {WhiteSpace}       { /* just skip what was found, do nothing */ }


/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
