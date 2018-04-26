# CalculatorCompiler
## A Calculator that accepts all forms of expressions. Compiler built in java , jFlex , Cup 
- Table of contents

- Overview
- User Guide
- Calculator Design 
- Regular expressions
- Grammars and semantic rules
- Output Screenshots
- Calculator features
- Limitations




#### Overview
This is a report on Calculator compiler built in java language as a part of Programing Languages and Compilers course. The operations it supports are addition,subtraction, multiplication and division. It also supports unary +/- operators. 
Its unique features include acceptance of Infix, Prefix and Postfix expressions and evaluating the result and also the equivalent notations in other forms.
This calculator has got a user interface to make the interaction easy and consistent.
#### user guide
The files are:
- Ycalc.cup  -- The CUP file where in the Grammar symbols and rules are declared.
- Lcalc.flex  -- The JFlex file where the lex code for compilation is declared.
- Main.java – The Java file where the parser is called. It includes JFrame user interface code also
- Build.xml – The XML file.
- Sample.inp – The input file where the input expression is read from.
- Token.java – The java file for calculating the expression value and also converting infix to prefix and postfix expression.
- ParseTree.java - This java file constructs an explicit parse tree.
- Parser.java & sym.java – CUP generated file. These files get generated when CUP is build.
- Lexer.java – Jflex generated file.



#### Calculator Design

                                                                                  input - {0,1,..9,+,-,*,/,(,),.}
                                                                                                             (infix/prefix/postfix expression)



                                                                                                                                Tokens =num,+,*,-,/,( ,),.
                                                                                                                              



                                                                                                                               Parse Tree




	                                            Parse tree

#### output :

- evaluation Result
-infix notation
- prefix notation
- postfix notation




#### Regular Expressions (in lcalc.jflex) : 
          
int = 0 | [1-9][0-9]*
num = {int}("."[0-9]+)?
WhiteSpace     = {\r|\n|\r\n} | [ \t\f]


#### Grammar And Semantic Rules (in ycalc.cup)

grammars used :

Grammar for infix expressions
```
P-> E
E -> E - T | E + T | T
T -> T / F | T*F | F
F -> ( E ) | -F | +F | num
```
Grammar for postfix expressions

          P -> L
          L -> K K + | K K  - 
          L -> K K * | K K /
          K -> L | -K | +K | num
         
         


 Grammar for prefix expressions

          P -> M
          M -> + J J | - J J
          M -> * J J  | / J J 
          J -> M | -J | +J | num


SDT for Evaluating infix  expression
```
P -> E                      { print(E.val) }
E -> E - T                 {  E.val = E1.val - T.val  }
E -> E + T             {  E.val = E1.val + T.val  }
 E ->  T                     {  E.val = T.val  }
T -> T / F                { T.val = T1.val / F.val  }
T ->  T*F                 {  T.val = T1.val * F.val  }
T -> F                      {  T.val = F.val  }
F -> ( E )                  { F.val = E.val }
F -> -F                      {F.val = -F.val}
F -> +F                      {F.val = +F.val}
F -> num                 { F.val = num.lexval }

```

SDT for Evaluating Postfix  expression          
```

          P -> L          	      { print(L.postfix) }

          L -> K K - | K K  +   		{  L.val = K1.val - K2.val  }
		{  L.val = K1.val + K2.val  }

          L -> K K / | K K *		{  L.val = K1.val / K2.val  }
		{  L.val = K1.val * K2.val  }
          
K -> -K                                        {K.val = -K.val}
K -> +K                                        {K.val = +K.val}
          K -> L | num	      { K.val = L.val }
             		 { K.val = num.lexval }

```

SDT for Evaluating prefix  expression

```

          P -> L          	      { print(L.val) }

          L -> - K K  | + K K     		{  L.val = K1.val - K2.val  }
		{  L.val = K1.val + K2.val  }

          L -> / K K  | * K K 		{  L.val = K1.val / K2.val  }
		{  L.val = K1.val * K2.val  }
K -> -K                                        {K.val = -K.val}
K -> +K                                        {K.val = +K.val}
          K -> L | num	      { K.val = L.val }
             		 { K.val = num.lexval }

```

SDT for converting infix notation into prefix.

```
P -> E                                  { print(E.pre) }
E -> E - T 	{E.prefix = “-”,E.prefix,  T.prefix}
E -> E + T 	{E.prefix = “+”,E.prefix,  T.prefix}
E -> T 	{E.prefix = T.prefix}
T -> T / F	 {T.prefix = “/”,T.prefix, F.prefix}
T -> T * F 	{T.prefix = “*”,T.prefix, F.prefix}
F -> ( E ) 	{F.prefix =E.prefix}
F -> -F                                 {F.prefix = “( -”,  F.prefix , “)”}
F -> +F                                 {F.prefix = “( +”,  F.prefix , “)”}
F -> num 	{ F.pre = num.lexval }

```



SDT for converting infix notation into postfix.

```
P -> E                                   { print(E.postfix) }
E -> E - T	 {E.postfix =E.postfix,  T.postfix, “-”}
E -> E + T 	{E.postfix =E.postfix,  T.postfix, “+”}
E -> T	 {E.postfix = T.postfix}
T -> T / F 	{T.postfix = T.postfix, M.postfix, “/”}
T -> T * F 	{T.postfix = T.postfix, M.postfix, “*”}
T -> F 	{T.postfix =F.postfix}
F -> ( E ) 	{F.postfix = E.postfix}
F -> -F                                 {F.postfix = “( -”,  F.postfix, “)”}
F -> +F                                 {F.postfix= “( +”,  F.postfix , “)”}
F -> num 	{P.postfix = num}

```



#### Calculator Features

The calculator can compute addition, subtraction, multiplication and division operations.
It accepts real numbers and the input can be any of the following forms :
- infix expression
- prefix expression
- postfix expression
Infix expressions can be written unambiguously using parentheses.                           	
The calculator also prints equivalent notation of infix/prefix/postfix expressions correspondingly.
There are three different evaluation buttons for infix, prefix postfix evaluation each in the UI.
The smart calculator also accepts unary operators +/-


#### Limitations 
The calculations are limited to basic arithmetic operations +, -, *, /.
Space has to be given after entering every token in order to separate tokens. 
