module Repl where

import Parser
import Lexer
import Interp
import Type

import Data.Char

-- Función encargada de llevar la ejecución del programa mediante los siguientes pasos:
-- 1. Impresión del propt.
-- 2. Lectura de una cadena.
-- 3. Si la cadana es igual a ":q", se cierra el intérprete.
-- 4. En caso contrario, realiza la generación de código ejecutable aplicando los análisis en
--    orden siguiente: léxico, sintáctico, semántico.
-- 5. Vuelve a ejecutar el ciclo.



{-  EL BUENOOOOOOOOOOOOOOOOOOOOOOOO
repl = do
    putStr "> "
    str <- getLine
    if str == ":q" then
        putStrLn "Bye."
    else do
        case interp (parser (lexer str)) [] of  -- Pasamos ambiente vacío []
            NumV n -> putStrLn $ show n
            BooleanV b -> putStrLn $ show b
            StateV env -> putStrLn $ show env
            --ExprV e env -> putStrLn $ show $ interp e env
        repl -}

{- ESTE IMPRIME TOKEN Y ASAś
repl = do
    putStr "> "
    str <- getLine
    if str == ":q" then
        putStrLn "Bye."
    else do
        let tokens = lexer str
        let ast = parser tokens
        putStrLn $ "Tokens: " ++ show tokens
        putStrLn $ "AST: " ++ show ast
        case interp ast [] of
            NumV n -> putStrLn $ show n
            BooleanV b -> putStrLn $ show b
            StateV env -> putStrLn $ show env
        repl-}
repl = do
    putStr "> "
    str <- getLine
    if str == ":q" then
        putStrLn "Bye."
    else do
        let tokens = lexer str
        let ast = parser tokens
        -- Primero verifica tipos
        case typeof ast [] of
            TUnit -> do  -- Si es un comando válido, procede a interpretarlo
                case interp ast [] of
                    NumV n -> putStrLn $ show n
                    BooleanV b -> putStrLn $ show b
                    StateV env -> putStrLn $ show env
            t -> putStrLn $ "Tipo: " ++ show t  -- Para expresiones, muestra su tipo
        repl



-- Función principal. Da la bienvenida al usuario y ejecuta el REPL.
run = do
  putStrLn "IMP Bienvenido." 
  repl

main = run







{-
repl = do
   putStr "> "
   str <- getLine
   if str == "(exit)" 
   then putStrLn "Bye."
   else do
       putStrLn $ show $ eval str
       repl
   where
       eval str = case interp (parse (lexer str)) [] of
           NumV n -> n 
           BoolV b -> b
           StateV env -> env
           ExprV e env -> interp e env -}