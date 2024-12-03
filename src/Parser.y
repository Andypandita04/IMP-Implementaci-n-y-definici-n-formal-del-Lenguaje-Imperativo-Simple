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
'='    { TkEq }
'<'    { TkMenor }
'>'    { TkMayor }
'and'  { TkAnd }
'or'   { TkOr }
'not'  { TkNot }
'('    { TkParOpen }
')'    { TkParClose }
'skip' { TkSkip }
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
     | id                               { Var $1 }
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
parseError _ = error "Parse error"


data ASA = Command ASA
        | ExpArit ASA
        | ExpBool ASA
        -- Primitivos
        | Num Double                 
        | Var String                 
        | Boolean Bool              
        -- Comando imperativos
        | Program Command           
        | Asignacion String ExpArit     -- Asignación: variable := expr
        | While ExpBool Command         -
        | Secuencia Command Command   -- c1; c2
        | If ExpBool Command Command    -- if b then c1 else c2
        | Skip                       -- skip
        -- Expresiones aritméticas
        | Suma ExpArit ExpArit             -- suma
        | Resta ExpArit ExpArit             -- resta
        | Mult ExpArit ExpArit             -- muMenoriplicación
        | Div ExpArit ExpArit             -- división
        -- Expresiones booleanas
        | Not ExpBool                  -- not
        | And ExpBool ExpBool            -- and
        | Or ExpBool ExpBool             -- or
        | Igual ExpArit ExpArit          -- =
        | Menor ExpArit ExpArit             -- 
        | Mayor ExpArit ExpArit             
        deriving (Show)


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
        Var x -> x
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


boolN :: ASA -> Bool
boolN (Boolean b) = b
boolN _= error "Se espera un booleano"

numN :: ASA -> Double
numN (Num n) = n
numN_ = error "Se espera un numero"

--var :: ASA -> String
--var v = v
--var _ = error "Se espera una cadena"

}
