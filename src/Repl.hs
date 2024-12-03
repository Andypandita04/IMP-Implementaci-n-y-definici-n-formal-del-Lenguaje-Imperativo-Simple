module Repl where

import Parser
import Lexer
import Interp
import Test

import Data.Char

-- Función encargada de llevar la ejecución del programa mediante los siguientes pasos:
-- 1. Impresión del propt.
-- 2. Lectura de una cadena.
-- 3. Si la cadana es igual a ":q", se cierra el intérprete.
-- 4. En caso contrario, realiza la generación de código ejecutable aplicando los análisis en
--    orden siguiente: léxico, sintáctico, semántico.
-- 5. Vuelve a ejecutar el ciclo.
repl = do
  putStr "> "
  str <- getLine
  let lst = words str
  if str == ":q" then 
    putStrLn "Bye." 
    else if lst !! 0 == "test" then
    if all isDigit (lst !! 1) then
      runTests (read $ lst !! 1) >> repl
    else repl
    else do
    putStrLn $ show (interp (parser (lexer str)))
    repl

-- Función principal. Da la bienvenida al usuario y ejecuta el REPL.
run = do
  putStrLn "Mini-Lisp v2.0. Bienvenido." 
  repl

main = run
