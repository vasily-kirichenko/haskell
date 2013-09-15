module Main where

import           Control.Monad      (forM_)
import           System.Environment (getArgs)
import           Text.Printf        (printf)

data My = My
	{ c1 :: Int
	, c22 :: String }

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

main :: IO()
main = do
    args <- getArgs
    let n = case args of
        		[nStr] -> read nStr
        		_ -> 10
    	fibs = map (\x -> (x, (fib x))) [0..n]
    forM_ fibs (uncurry $ printf "fib %d = %d\n")
    putStrLn "done."
