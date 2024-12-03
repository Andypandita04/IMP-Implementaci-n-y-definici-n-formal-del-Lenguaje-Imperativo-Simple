{
module Parser where

import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token

{- Definición de los tokens -}

%%

{- Definición de la sintaxis concreta -}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data ASA

instance Show ASA where
  show = undefined

bool :: ASA -> Bool
bool = undefined

num :: ASA -> Double
num = undefined
}
