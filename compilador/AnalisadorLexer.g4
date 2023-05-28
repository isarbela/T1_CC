lexer grammar AnalisadorLexer;


// Tipo self faz o tipo do token ter o mesmo nome do lexema. (Gambiarra no código Main.py)
// Contém palavras chaves e operadores da linguagem LA.
SELF :	'algoritmo' | 'declare' | ':' | 'literal' | 'inteiro' | 'leia'
	| 'escreva' | ',' | 'fim_algoritmo' | '(' | ')' | '<-' | '+' | '-'
	| '*' | '/' | '..' | 'real' | '%' | '>' | '<' | '<>' | '>=' | '<='
	| '=' | 'se' | 'entao' | 'fim_se' | 'senao' | 'enquanto' | 'faca'
	| 'fim_enquanto' |  '^' | '.' | '[' | ']' | 'registro' | 'fim_registro'
	| 'e' | 'nao' | 'logico' | 'ou' | 'caso' | 'seja' | 'para' | 'ate' 
	| 'fim_para' | 'fim_caso' | '&' | 'tipo' | 'procedimento' | 'var'
	| 'funcao' | 'retorne' | 'fim_funcao' | 'fim_procedimento' | 'constante'
	| 'verdadeiro' | 'falso'
	; 

// Detecção de números reais e inteiros.
// A ordem importa.
NUM_INT	: /*('+'|'-')?*/('0'..'9')+
 	;
NUM_REAL : /*('+'|'-')?*/('0'..'9')+ ('.' ('0'..'9')+)?
 	;

// Variáveis
IDENT : ('a'..'z'|'A'..'Z' | '_') ('_' | 'a'..'z'|'A'..'Z'|'0'..'9')*
	;

// Cadeia de caracteres são identificadas através do operador de aspas
// duplas, diferentemente do exemplo de aula que era aspas simples.
CADEIA 	: '"' ( ESC_SEQ | ~('"'|'\\' | '\n') )* '"'
	;
fragment
ESC_SEQ	: '\\"';

// Comentários são identificados através de chaves e fecha chaves.
COMENTARIO
    :   ('{' ~('\n'|'\r' | '}')* '\r'?  '}') -> skip
    ;

// Espaços em branco são ignorados.
WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) -> skip
    ;

// Detecção de erros.
CADEIA_NAO_FECHADA : '"' ~('"')* '\r'? '\n'
	;
COMENTARIO_NAO_FECHADO
	: '{' ~('}')* '\r'? '\n'
    ;

ERRO : . 
	;