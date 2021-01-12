grammar Javva;

build: import_define* ( classDeclaration );

import_define: 'import' PACKAGE ';' ;

classDeclaration
    :   'class' IDENTIFIER class_body
    ;

classs_define: 'class' IDENTIFIER class_body;

class_body: '{' method_declaration* '}';

method_declaration: type ('[' ']')* IDENTIFIER method_declaration_rest | 'void' IDENTIFIER method_declaration_rest;
type: INT | STRING | INTEGER | LIST ('<' type '>')? | MAP ('<' type ',' type '>');
method_declaration_rest: '(' comment* ')' ;
comment: '/*' .*? '*/';
INT: 'int';
LIST: 'List';
MAP: 'Map';
STRING: 'String';
INTEGER: 'Integer';
PACKAGE: [a-zA-Z.]+;
WS: [ \r\n] -> skip;

IDENTIFIER
    :   Letter (Letter|JavaIDDigit)*
    ;

    /**I found this char range in JavaCC's grammar, but Letter and Digit overlap.
       Still works, but...
     */
fragment
Letter
    :  '\u0024' |
       '\u0041'..'\u005a' |
       '\u005f' |
       '\u0061'..'\u007a' |
       '\u00c0'..'\u00d6' |
       '\u00d8'..'\u00f6' |
       '\u00f8'..'\u00ff' |
       '\u0100'..'\u1fff' |
       '\u3040'..'\u318f' |
       '\u3300'..'\u337f' |
       '\u3400'..'\u3d2d' |
       '\u4e00'..'\u9fff' |
       '\uf900'..'\ufaff'
    ;

fragment
JavaIDDigit
    :  '\u0030'..'\u0039' |
       '\u0660'..'\u0669' |
       '\u06f0'..'\u06f9' |
       '\u0966'..'\u096f' |
       '\u09e6'..'\u09ef' |
       '\u0a66'..'\u0a6f' |
       '\u0ae6'..'\u0aef' |
       '\u0b66'..'\u0b6f' |
       '\u0be7'..'\u0bef' |
       '\u0c66'..'\u0c6f' |
       '\u0ce6'..'\u0cef' |
       '\u0d66'..'\u0d6f' |
       '\u0e50'..'\u0e59' |
       '\u0ed0'..'\u0ed9' |
       '\u1040'..'\u1049'
   ;
