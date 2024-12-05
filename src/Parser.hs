{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,109) ([256,9344,256,9344,0,512,0,256,0,0,1920,48,1920,48,0,0,63488,3,0,16396,0,0,0,0,0,0,0,0,1920,48,1920,48,0,2060,384,32,256,9344,0,0,30720,0,384,32,1920,48,1920,48,256,9344,63488,67,0,76,0,0,256,9344,384,32,384,32,384,32,384,32,384,32,384,32,384,32,30720,0,30720,0,30720,0,0,0,0,0,24576,0,24576,0,0,0,0,0,0,0,0,4608,0,4,0,0,30720,64,256,9344,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","Command","ExpArit","ExpBool","num","id","true","false","'+'","'-'","'*'","'/'","'='","'<'","'>'","'and'","'or'","'not'","'('","')'","'skip'","':='","';'","'if'","'then'","'else'","'while'","'do'","%eof"]
        bit_start = st Prelude.* 32
        bit_end = (st Prelude.+ 1) Prelude.* 32
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..31]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyShift action_3
action_0 (24) = happyShift action_4
action_0 (27) = happyShift action_5
action_0 (30) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_3
action_1 (24) = happyShift action_4
action_1 (27) = happyShift action_5
action_1 (30) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_18
action_2 _ = happyReduce_1

action_3 (25) = happyShift action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_6

action_5 (8) = happyShift action_10
action_5 (9) = happyShift action_11
action_5 (10) = happyShift action_12
action_5 (11) = happyShift action_13
action_5 (21) = happyShift action_14
action_5 (22) = happyShift action_15
action_5 (6) = happyGoto action_8
action_5 (7) = happyGoto action_16
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (8) = happyShift action_10
action_6 (9) = happyShift action_11
action_6 (10) = happyShift action_12
action_6 (11) = happyShift action_13
action_6 (21) = happyShift action_14
action_6 (22) = happyShift action_15
action_6 (6) = happyGoto action_8
action_6 (7) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (32) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (12) = happyShift action_29
action_8 (13) = happyShift action_30
action_8 (14) = happyShift action_31
action_8 (15) = happyShift action_32
action_8 (16) = happyShift action_33
action_8 (17) = happyShift action_34
action_8 (18) = happyShift action_35
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (19) = happyShift action_22
action_9 (20) = happyShift action_23
action_9 (31) = happyShift action_28
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_7

action_11 _ = happyReduce_8

action_12 _ = happyReduce_14

action_13 _ = happyReduce_15

action_14 (8) = happyShift action_10
action_14 (9) = happyShift action_11
action_14 (10) = happyShift action_12
action_14 (11) = happyShift action_13
action_14 (21) = happyShift action_14
action_14 (22) = happyShift action_15
action_14 (6) = happyGoto action_8
action_14 (7) = happyGoto action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (8) = happyShift action_10
action_15 (9) = happyShift action_11
action_15 (10) = happyShift action_12
action_15 (11) = happyShift action_13
action_15 (21) = happyShift action_14
action_15 (22) = happyShift action_15
action_15 (6) = happyGoto action_25
action_15 (7) = happyGoto action_26
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (19) = happyShift action_22
action_16 (20) = happyShift action_23
action_16 (28) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (8) = happyShift action_10
action_17 (9) = happyShift action_11
action_17 (22) = happyShift action_21
action_17 (6) = happyGoto action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (9) = happyShift action_3
action_18 (24) = happyShift action_4
action_18 (27) = happyShift action_5
action_18 (30) = happyShift action_6
action_18 (5) = happyGoto action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_3

action_20 (12) = happyShift action_29
action_20 (13) = happyShift action_30
action_20 (14) = happyShift action_31
action_20 (15) = happyShift action_32
action_20 _ = happyReduce_2

action_21 (8) = happyShift action_10
action_21 (9) = happyShift action_11
action_21 (22) = happyShift action_21
action_21 (6) = happyGoto action_49
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (8) = happyShift action_10
action_22 (9) = happyShift action_11
action_22 (10) = happyShift action_12
action_22 (11) = happyShift action_13
action_22 (21) = happyShift action_14
action_22 (22) = happyShift action_15
action_22 (6) = happyGoto action_8
action_22 (7) = happyGoto action_48
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_10
action_23 (9) = happyShift action_11
action_23 (10) = happyShift action_12
action_23 (11) = happyShift action_13
action_23 (21) = happyShift action_14
action_23 (22) = happyShift action_15
action_23 (6) = happyGoto action_8
action_23 (7) = happyGoto action_47
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (9) = happyShift action_3
action_24 (24) = happyShift action_4
action_24 (27) = happyShift action_5
action_24 (30) = happyShift action_6
action_24 (5) = happyGoto action_46
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_29
action_25 (13) = happyShift action_30
action_25 (14) = happyShift action_31
action_25 (15) = happyShift action_32
action_25 (16) = happyShift action_33
action_25 (17) = happyShift action_34
action_25 (18) = happyShift action_35
action_25 (23) = happyShift action_45
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (19) = happyShift action_22
action_26 (20) = happyShift action_23
action_26 (23) = happyShift action_44
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_19

action_28 (9) = happyShift action_3
action_28 (24) = happyShift action_4
action_28 (27) = happyShift action_5
action_28 (30) = happyShift action_6
action_28 (5) = happyGoto action_43
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (8) = happyShift action_10
action_29 (9) = happyShift action_11
action_29 (22) = happyShift action_21
action_29 (6) = happyGoto action_42
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (8) = happyShift action_10
action_30 (9) = happyShift action_11
action_30 (22) = happyShift action_21
action_30 (6) = happyGoto action_41
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (8) = happyShift action_10
action_31 (9) = happyShift action_11
action_31 (22) = happyShift action_21
action_31 (6) = happyGoto action_40
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (8) = happyShift action_10
action_32 (9) = happyShift action_11
action_32 (22) = happyShift action_21
action_32 (6) = happyGoto action_39
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_10
action_33 (9) = happyShift action_11
action_33 (22) = happyShift action_21
action_33 (6) = happyGoto action_38
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (8) = happyShift action_10
action_34 (9) = happyShift action_11
action_34 (22) = happyShift action_21
action_34 (6) = happyGoto action_37
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (8) = happyShift action_10
action_35 (9) = happyShift action_11
action_35 (22) = happyShift action_21
action_35 (6) = happyGoto action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (12) = happyShift action_29
action_36 (13) = happyShift action_30
action_36 (14) = happyShift action_31
action_36 (15) = happyShift action_32
action_36 _ = happyReduce_18

action_37 (12) = happyShift action_29
action_37 (13) = happyShift action_30
action_37 (14) = happyShift action_31
action_37 (15) = happyShift action_32
action_37 _ = happyReduce_17

action_38 (12) = happyShift action_29
action_38 (13) = happyShift action_30
action_38 (14) = happyShift action_31
action_38 (15) = happyShift action_32
action_38 _ = happyReduce_16

action_39 _ = happyReduce_12

action_40 _ = happyReduce_11

action_41 (14) = happyShift action_31
action_41 (15) = happyShift action_32
action_41 _ = happyReduce_10

action_42 (14) = happyShift action_31
action_42 (15) = happyShift action_32
action_42 _ = happyReduce_9

action_43 _ = happyReduce_5

action_44 _ = happyReduce_22

action_45 _ = happyReduce_13

action_46 (26) = happyShift action_18
action_46 (29) = happyShift action_50
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_22
action_47 _ = happyReduce_21

action_48 _ = happyReduce_20

action_49 (12) = happyShift action_29
action_49 (13) = happyShift action_30
action_49 (14) = happyShift action_31
action_49 (15) = happyShift action_32
action_49 (23) = happyShift action_45
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (9) = happyShift action_3
action_50 (24) = happyShift action_4
action_50 (27) = happyShift action_5
action_50 (30) = happyShift action_6
action_50 (5) = happyGoto action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_4

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TkId happy_var_1))
	 =  HappyAbsSyn5
		 (Asignacion happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Secuencia happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 6 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  5 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn5
		 (Skip
	)

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyTerminal (TkDouble happy_var_1))
	 =  HappyAbsSyn6
		 (Num happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyTerminal (TkId happy_var_1))
	 =  HappyAbsSyn6
		 (Id happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Suma happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Resta happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (Boolean True
	)

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn7
		 (Boolean False
	)

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (Igual happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (Menor happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  7 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (Mayor happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  7 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Not happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (And happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Or happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 32 32 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkDouble happy_dollar_dollar -> cont 8;
	TkId happy_dollar_dollar -> cont 9;
	TkTrue -> cont 10;
	TkFalse -> cont 11;
	TkSuma -> cont 12;
	TkResta -> cont 13;
	TkMult -> cont 14;
	TkDiv -> cont 15;
	TkIgual -> cont 16;
	TkMenor -> cont 17;
	TkMayor -> cont 18;
	TkAnd -> cont 19;
	TkOr -> cont 20;
	TkNot -> cont 21;
	TkParOpen -> cont 22;
	TkParClose -> cont 23;
	TkSkip -> cont 24;
	TkAsig -> cont 25;
	TkSeq -> cont 26;
	TkIf -> cont 27;
	TkThen -> cont 28;
	TkElse -> cont 29;
	TkWhile -> cont 30;
	TkDo -> cont 31;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 32 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError tokens = error $ "Parse error: " ++ show tokens
parseError _ = error "Parse error"


data ASA =  Num Double                 
        | Id String                 
        | Boolean Bool              
        -- Comando imperativos
        | Program ASA           
        | Asignacion String ASA     -- Asignación: variable := expr
        | While ASA ASA         
        | Secuencia ASA ASA   
        | If ASA ASA ASA    -- if b then c1 else c2
        | Skip                      
        -- Expresiones aritméticas
        | Resta ASA ASA           
        | Suma ASA ASA            
        | Mult ASA ASA            
        | Div ASA ASA             
        -- Expresiones booleanas
        | Not ASA                 
        | And ASA ASA         
        | Or ASA ASA          
        | Igual ASA ASA       
        | Menor ASA ASA       
        | Mayor ASA ASA             
        --deriving (Show)


instance Show ASA where
    show ast = case ast of
        -- Programa
        Program a -> show a        
        -- Comandos
        Asignacion var exp -> var ++ " := " ++ show exp
        Secuencia a b -> show a ++ "; " ++ show b
        If c t e -> "if " ++ show c ++ 
                        " then " ++ show t ++ 
                        " else " ++ show e
        While c b -> "while " ++ show c ++ 
                         " do " ++ show b
        Skip -> "skip" 
        -- Expresiones Aritméticas
        Num n -> show n
        Id x -> x
        Suma e1 e2 -> "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
        Resta e1 e2 -> "(" ++ show e1 ++ " - " ++ show e2 ++ ")"
        Mult e1 e2 -> "(" ++ show e1 ++ " * " ++ show e2 ++ ")"
        Div e1 e2 -> "(" ++ show e1 ++ " / " ++ show e2 ++ ")"
        -- Expresiones Booleanas
        Boolean b -> show b
        Not b -> "(not " ++ show b ++ ")"
        And b1 b2 -> "(" ++ show b1 ++ " and " ++ show b2 ++ ")"
        Or b1 b2 -> "(" ++ show b1 ++ " or " ++ show b2 ++ ")"
        Igual e1 e2 -> "(" ++ show e1 ++ " = " ++ show e2 ++ ")"
        Menor e1 e2 -> "(" ++ show e1 ++ " < " ++ show e2 ++ ")"
        Mayor e1 e2 -> "(" ++ show e1 ++ " > " ++ show e2 ++ ")"


--boolN :: ASA -> Bool
--boolN (Boolean b) = b
--boolN _= error "Se espera un booleano"

--numN :: ASA -> Double
--numN (Num n) = n
--numN_ = error "Se espera un numero"

--var :: ASA -> String
--var v = v
--var _ = error "Se espera una cadena"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
