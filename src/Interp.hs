module Interp where

import Parser

type Env = [(String, Value)]

data Value = NumV Double
           | BooleanV Bool
           | StateV Env 

interp :: ASA -> Env -> Value

-- Primitivos
interp (Id i) env = lookupEnv i env 
   {-case lookupEnv i env of
   StateV env' -> lookupEnv i env'
   val -> val-}
interp (Num n) env = (NumV n)
interp (Boolean b) env = (BooleanV b)
-- Expresiones aritmeticas
interp (Suma i d) env = NumV ((numN (interp i env)) + (numN (interp d env)))
interp (Resta i d) env = NumV ((numN (interp i env)) - (numN (interp d env)))
interp (Mult i d) env = NumV ((numN (interp i env)) * (numN (interp d env)))
interp (Div i d) env = NumV ((numN (interp i env)) / (numN (interp d env)))
-- Expresiones Booleanas
interp (Not e) env = BooleanV (not (boolN (interp e env)))
interp (And i d) env = BooleanV ((boolN (interp i env)) && (boolN (interp d env)))
interp (Or i d) env = BooleanV ((boolN (interp i env)) || (boolN (interp d env)))
interp (Igual i d) env = BooleanV ((numN (interp i env)) == (numN (interp d env)))
interp (Menor i d) env = BooleanV ((numN (interp i env)) < (numN (interp d env)))
interp (Mayor i d) env = BooleanV ((numN (interp i env)) > (numN (interp d env)))
-- Comando imperativos
interp (Program e) env = (interp e env) --


interp (If c t e) env = 
    let c' = (interp c env) 
    in if (boolN c') then  (interp t env) else (interp e env)


interp (Asignacion var exp) env =
    let val = interp exp env
    in StateV ((var, val):env)

interp (Secuencia c1 c2) env =
    case interp c1 env of
        StateV env' -> interp c2 env'
        _ -> error "Error interp:  Comando inválido"

interp (Skip) env = StateV env  -- Skip mantiene el ambiente sin cambios

interp (While cond body) env = 
   case interp cond env of
       BooleanV True -> 
           case interp body env of
               StateV env' -> interp (While cond body) env'
               _ -> error "Error interp:  Cuerpo while debe retornar estado"
       BooleanV False -> StateV env
       _ -> error "Error interp:  Condición debe ser booleana"

{-
interp (Asignacion var exp) env = 
    let expEva = (interp exp env)
    in (var, expEva) : env       --Evalua la expresion y lo guarda en el ambiente

interp (While c d) env =
   case interp c env of
       Boolean True -> 
           let envNew = interp d env  -- Ejecuta el cuerpo
           in interp (While c d) envNew  -- Recursión con nuevo ambiente
       Boolean False -> env  -- Condición falsa, retorna ambiente sin cambios
       _ -> error "Condición debe ser booleana"

interp (Secuencia i d) env = 
    let env' = (interp i env) --Aqui el primer comando 
    in (interp d env')        --Ejecuta segundo comando con el ambiente actulizado

interp (Skip) env = env -}



lookupEnv :: String -> Env -> Value
lookupEnv i [] = error ("Error interp: Variable libre: "  ++ i)
lookupEnv i ((j, v) : xs)
   | i == j = v
   | otherwise = lookupEnv i xs




boolN :: Value -> Bool
boolN (BooleanV b) = b
boolN _= error "Error interp:  Se espera un booleano"

numN :: Value -> Double
numN (NumV n) = n
numN_ = error "Error interp:  Se espera un numero"


instance Show Value where
    show (NumV n) = show n
    show (BooleanV b) = show b
    show (StateV env) = show env