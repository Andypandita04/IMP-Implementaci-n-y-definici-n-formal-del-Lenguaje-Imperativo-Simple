-- | ESTE ARCHIVO DEBE SER SOBREESCRITO POR HAPPY
module Parser where

import Lexer

parser :: [Token] -> ASA
parser = undefined

parseError :: [Token] -> a
parseError _ = error "Parse error"

data ASA

instance Show ASA where
  show = undefined

bool :: ASA -> Bool
bool = undefined

num :: ASA -> Double
num = undefined
