module Interp where
import Parser
type Env = [(String, ASA)]
interp :: ASA -> Env -> ASA
-- Primitivos
interp (Id i) env = lookupEnv i env
interp (Num n) env = (Num n)
interp (Boolean b) env = (Boolean b)
-- Expresiones aritmeticas
interp (Suma i d) env = Num ((numN (interp i env)) + (numN (interp d env)))
interp (Resta i d) env = Num ((numN (interp i env)) - (numN (interp d env)))
interp (Mult i d) env = Num ((numN (interp i env)) * (numN (interp d env)))
interp (Div i d) env = Num ((numN (interp i env)) / (numN (interp d env)))
-- Expresiones Booleanas
interp (Not e) env = Boolean (not (boolN (interp e env)))
interp (And i d) env = Num ((BoolN (interp i env)) && (BoolN (interp d env)))
interp (Or i d) env = Num ((BoolN (interp i env)) || (BoolN (interp d env)))
interp (Igual i d) env = Bool ((NumN (interp i env)) == (NumN (interp d env)))
interp (Menor i d) env = Bool ((NumN (interp i env)) < (NumN (interp d env)))
interp (Mayor i d) env = Bool ((NumN (interp i env)) > (NumN (interp d env)))
-- Comando imperativos
interp (Program e) env = 
interp (Command a) env = 
interp (Secuencia i d) env = 
interp (If c t e) env = 
interp (Skip) env = 

lookupEnv :: String -> Env -> ASA
lookupEnv i [] = error ("Variable libre: " ++ i)
lookupEnv i ((j, v) : xs)
  | i == j = v
  | otherwise = lookupEnv i xs




