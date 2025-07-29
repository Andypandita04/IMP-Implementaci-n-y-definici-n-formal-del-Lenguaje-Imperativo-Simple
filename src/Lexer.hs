module Lexer where

import Data.Char

data Token = TkDouble Double
           | TkSuma
           | TkResta
           | TkDiv
           | TkMult
           | TkParOpen
           | TkParClose
           | TkMenor
           | TkMayor
           | TkIgual
           | TkAnd
           | TkOr
           | TkNot
           | TkTrue  
           | TkFalse 
           | TkAsig
           | TkSeq
           | TkIf
           | TkThen
           | TkElse
           | TkWhile
           | TkDo
           | TkId String
           | TkSkip



lexer :: String -> [Token]
lexer [] = []
-- Numeros 
lexer (c:cs)
    | isSpace c = lexer cs  
    | c == '-' = case cs of
        (d:ds) | isDigit d -> lexNum ('-':d:ds)  -- número negativo
               | otherwise -> TkResta : lexer cs  
    | isDigit c = lexNum (c:cs)
lexer ('+' : xs) = TkSuma : lexer xs
lexer ('/' : xs) = TkDiv : lexer xs
lexer ('*' : xs) = TkMult : lexer xs
lexer ('(':xs ) = TkParOpen: lexer xs
lexer (')':xs ) = TkParClose: lexer xs
lexer('>' : xs) = TkMayor : lexer xs 
lexer('<' : xs) =  TkMenor : lexer xs
lexer('=' : xs) = TkIgual : lexer xs
lexer('a' : 'n' : 'd' : xs) = TkAnd : lexer xs
lexer('o' : 'r' :  xs) = TkOr : lexer xs
lexer('n' : 'o' : 't' :  xs) = TkNot : lexer xs
lexer('t':'r':'u':'e': xs) = TkTrue  : lexer xs
lexer('f':'a':'l':'s':'e': xs) = TkFalse  : lexer xs
lexer ( ':' : '=' : xs) = TkAsig : lexer xs
lexer (';' : xs) = TkSeq : lexer xs
lexer ('i' : 'f' : xs) = TkIf : lexer xs
lexer('t' : 'h' : 'e' : 'n' :  xs) = TkThen : lexer xs
lexer('e' : 'l' : 's' : 'e' :  xs) = TkElse : lexer xs
lexer('w' : 'h' : 'i' : 'l' : 'e' :  xs) = TkWhile : lexer xs
lexer ( 'd' : 'o' : xs) = TkDo : lexer xs
lexer('s' : 'k' : 'i' : 'p' :  xs) = TkSkip : lexer xs
lexer (c:cs)
--- Identificadores
    | isAlpha c = lexId (c:cs)  
lexer _ = error "Error Lexer: Tk desconocido"

lexId :: String -> [Token]
lexId cs = case span isAlphaNum cs of
    (id, rest) -> TkId id : lexer rest

lexNum :: String -> [Token]
lexNum cs = case span (\c -> isDigit c || c == '.') cs of
    (num, rest) -> TkDouble (read num) : lexer rest

instance Show Token where
  show (TkDouble d) =  show d
  show (TkId d)     =  d 
  show TkSuma       = "+"
  show TkResta      = "-"
  show TkDiv        = "/"
  show TkMult       = "*"
  show TkParOpen    = "("
  show TkParClose   = ")"
  show TkMenor      = "<"
  show TkMayor      = ">"
  show TkIgual      = "="
  show TkAnd        = "and"
  show TkOr         = "or"
  show TkNot        = "not"
  show TkTrue       = "true"
  show TkFalse      = "false"
  show TkAsig       = ":="
  show TkSeq        = ";"
  show TkIf         = "if"
  show TkThen       = "then"
  show TkElse       = "else"
  show TkWhile      = "while"
  show TkDo         = "do"
  show TkSkip       = "skip"