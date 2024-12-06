module Type where

data Type = TNum | TBool | TUnit  
    deriving (Show, Eq)

type TypeEnv = [(String, Type)]

typeof :: ASA -> TypeEnv -> Type

typeof (Num _) _ = TNum
typeof (Boolean _) _ = TBool
typeof (Id x) env = lookupType x env
-- Expresiones Aritmeticas
typeof (Suma e1 e2) env =  checarEA e1 e2 env
typeof (Resta e1 e2) env =  checarEA e1 e2 env
typeof (Mult e1 e2) env =  checarEA e1 e2 env
typeof (Div e1 e2) env =  checarEA e1 e2 env
-- Expresiones Booleanas
typeof (Not e) env = case typeof e env of
    TBool -> TBool
    _ -> error "Not requiere booleano"
typeof (And e1 e2) env =  checarEBe1 e2 env
typeof (Or e1 e2) env =  checarEB e1 e2 env

typeof (Igual e1 e2) env =  checarECom e1 e2 env
typeof (Menor e1 e2) env =  checarECom e1 e2 env
typeof (Mayor e1 e2) env =  checarECom e1 e2 env

--Comandos

typeof (Asignacion x e) env = 
    case typeof e env of
        TNum -> TUnit 
        _ -> error "Asignación requiere número"

typeof (Secuencia c1 c2) env =
    case (typeof c1 env, typeof c2 env) of
        (TUnit, TUnit) -> TUnit
        _ -> error "Secuencia requiere comandos"

typeof (If c t e) env =
    case typeof c env of
        TBool -> case (typeof t env, typeof e env) of
                   (TUnit, TUnit) -> TUnit
                   _ -> error "Ramas if deben ser comandos"
        _ -> error "Condición debe ser booleana"

typeof Skip _ = TUnit


checarEA :: ASA -> ASA -> TypeEnv -> Type
checarEA e1 e2 env = 
   case (typeof e1 env, typeof e2 env) of
       (TNum, TNum) -> TNum
       _ -> error "Operación aritmética requiere números"

checarECom :: ASA -> ASA -> TypeEnv -> Type
checarECom e1 e2 env = 
   case (typeof e1 env, typeof e2 env) of
       (TNum, TNum) -> TBool
       _ -> error "Comparación requiere números"

checarB :: ASA -> ASA -> TypeEnv -> Type
checarB e1 e2 env = 
   case (typeof e1 env, typeof e2 env) of
       (TBool, TBool) -> TBool
       _ -> error "Operación booleana requiere booleanos"

lookupType :: String -> TypeEnv -> Type
lookupType x [] = error $ "Variable no encontrada: " ++ x
lookupType x ((y,t):env) 
    | x == y = t
    | otherwise = lookupType x env