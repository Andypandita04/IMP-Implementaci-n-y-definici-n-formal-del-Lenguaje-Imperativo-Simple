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
interp (And i d) env = Boolean ((boolN (interp i env)) && (boolN (interp d env)))
interp (Or i d) env = Boolean ((boolN (interp i env)) || (boolN (interp d env)))
interp (Igual i d) env = Boolean ((numN (interp i env)) == (numN (interp d env)))
interp (Menor i d) env = Boolean ((numN (interp i env)) < (numN (interp d env)))
interp (Mayor i d) env = Boolean ((numN (interp i env)) > (numN (interp d env)))
-- Comando imperativos
interp (Program e) env = (interp e env) --
interp (If c t e) env = 
    let c' = (interp c env) 
    in if (boolN c') then  (interp t env) else (interp e env)



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

interp (Skip) env = env 



lookupEnv :: String -> Env -> ASA
lookupEnv i [] = error ("Variable libre: " ++ i)
lookupEnv i ((j, v) : xs)
  | i == j = v
  | otherwise = lookupEnv i xs




boolN :: ASA -> Bool
boolN (Boolean b) = b
boolN _= error "Se espera un booleano"

numN :: ASA -> Double
numN (Num n) = n
numN_ = error "Se espera un numero"



