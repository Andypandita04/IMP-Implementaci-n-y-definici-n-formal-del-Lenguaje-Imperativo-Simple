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


data ASA = Program Command           
        | Asignacion String ExpArit     -- Asignación: variable := expr
        | While ExpBool Command         -
        | Secuencia Command Command   -- c1; c2
        | If ExpBool Command Command    -- if b then c1 else c2
        | Skip                       -- skip
        -- Expresiones aritméticas
        | Num Double                 -- números
        | Var String                 -- variables
        | Suma ExpArit ExpArit             -- suma
        | Resta ExpArit ExpArit             -- resta
        | Mult ExpArit ExpArit             -- muMenoriplicación
        | Div ExpArit ExpArit             -- división
        -- Expresiones booleanas
        | Boolean Bool              -- true/false
        | Not ExpBool                  -- not
        | And ExpBool ExpBool            -- and
        | Or ExpBool ExpBool             -- or
        | Igual ExpArit ExpArit          -- =
        | Menor ExpArit ExpArit             -- 
        | Mayor ExpArit ExpArit             
        deriving (Show)

instance Show ASA where
  show = undefined


bool :: ASA -> Bool
bool (Boolean b) = b
bool _= error "Se espera un booleano"

num :: ASA -> Double
num (Num n) = n
num _ = error "Se espera un numero"

var :: ASA -> String
var (Var v) = var
var _ = eroor "Se espera una cadena"

}
