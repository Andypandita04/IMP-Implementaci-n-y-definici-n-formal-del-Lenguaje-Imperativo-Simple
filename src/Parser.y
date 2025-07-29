{
module Parser where

import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token
num    { TkDouble $$ }   
id     { TkId $$ }
true   { TkTrue }
false  { TkFalse }
'+'    { TkSuma }
'-'    { TkResta }
'*'    { TkMult }
'/'    { TkDiv }
'='    { TkIgual }
'<'    { TkMenor }
'>'    { TkMayor }
'and'  { TkAnd }
'or'   { TkOr }
'not'  { TkNot }
'('    { TkParOpen }
')'    { TkParClose }
'skip' { TkSkip }
':='   { TkAsig }
';'    { TkSeq }
'if'   { TkIf }
'then' { TkThen }
'else' { TkElse }
'while'{ TkWhile }
'do'   { TkDo }

%left 'or'
%left 'and'
%nonassoc '=' '<' '>'
%left '+' '-'
%left '*' '/'
%right 'not'
%left ';'  -- Secuenciación tiene la precedencia más baja
%nonassoc 'then'
%nonassoc 'else'
%nonassoc 'do'
%nonassoc 'while'
-- Declaración de prec
%%



{- Definición de la sintaxis concreta -}

Program : Command                   { Program $1 }

-- Comandos
Command : id ':=' ExpArit                                      { Asignacion $1 $3 }
       | Command ';' Command                                   { Secuencia $1 $3 }
       | 'if' ExpBool 'then' Command  'else' Command           { If $2 $4 $6 }
       | 'while' ExpBool 'do' Command                          { While $2 $4 }
       | 'skip'                                                { Skip }

-- Expresiones aritméticas
ExpArit : num                           { Num $1 }
     | id                               { Id $1 }
     | ExpArit '+' ExpArit              { Suma $1 $3 }
     | ExpArit '-' ExpArit              { Resta $1 $3 }
     | ExpArit '*' ExpArit              { Mult $1 $3 }
     | ExpArit '/' ExpArit              { Div $1 $3 }
     | '(' ExpArit ')'                  { $2 }

-- Expresiones booleanas
ExpBool : true                          { Boolean True }
     | false                            { Boolean False }
     | ExpArit '=' ExpArit              { Igual $1 $3 }
     | ExpArit '<' ExpArit              { Menor $1 $3 }
     | ExpArit '>' ExpArit              { Mayor $1 $3 }
     | 'not' ExpBool                    { Not $2 }
     | ExpBool 'and' ExpBool            { And $1 $3 }
     | ExpBool 'or' ExpBool             { Or $1 $3 }
     | '(' ExpBool ')'                  { $2 }

{
parseError :: [Token] -> a
parseError tokens = error $ "Parse error: " ++ show tokens
parseError _ = error "Parse error"


data ASA =  Num Double                 
        | Id String                 
        | Boolean Bool              
        -- Comando imperativos
        | Program ASA           
        | Asignacion String ASA     -- Asignación: variable := expr
        | While ASA ASA         
        | Secuencia ASA ASA   
        | If ASA ASA ASA    -- if b then c1 else c2
        | Skip                      
        -- Expresiones aritméticas
        | Resta ASA ASA           
        | Suma ASA ASA            
        | Mult ASA ASA            
        | Div ASA ASA             
        -- Expresiones booleanas
        | Not ASA                 
        | And ASA ASA         
        | Or ASA ASA          
        | Igual ASA ASA       
        | Menor ASA ASA       
        | Mayor ASA ASA             
        --deriving (Show)


instance Show ASA where
    show ast = case ast of
        -- Programa
        Program a -> show a        
        -- Comandos
        Asignacion var exp -> var ++ " := " ++ show exp
        Secuencia a b -> show a ++ "; " ++ show b
        If c t e -> "if " ++ show c ++ 
                        " then " ++ show t ++ 
                        " else " ++ show e
        While c b -> "while " ++ show c ++ 
                         " do " ++ show b
        Skip -> "skip" 
        -- Expresiones Aritméticas
        Num n -> show n
        Id x -> x
        Suma e1 e2 -> "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
        Resta e1 e2 -> "(" ++ show e1 ++ " - " ++ show e2 ++ ")"
        Mult e1 e2 -> "(" ++ show e1 ++ " * " ++ show e2 ++ ")"
        Div e1 e2 -> "(" ++ show e1 ++ " / " ++ show e2 ++ ")"
        -- Expresiones Booleanas
        Boolean b -> show b
        Not b -> "(not " ++ show b ++ ")"
        And b1 b2 -> "(" ++ show b1 ++ " and " ++ show b2 ++ ")"
        Or b1 b2 -> "(" ++ show b1 ++ " or " ++ show b2 ++ ")"
        Igual e1 e2 -> "(" ++ show e1 ++ " = " ++ show e2 ++ ")"
        Menor e1 e2 -> "(" ++ show e1 ++ " < " ++ show e2 ++ ")"
        Mayor e1 e2 -> "(" ++ show e1 ++ " > " ++ show e2 ++ ")"


}
