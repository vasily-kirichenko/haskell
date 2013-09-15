module Main where

import qualified Data.Map as Map
import Data.Map ((!))
import System.Environment (getArgs)

main :: IO()
main = do
	args <- getArgs
	let n = 
		case args of
			[strN] -> read strN :: Int
			_ -> error "wrong arg"

	let m = Map.fromList . map (\x -> (x, x)) $ [1..n]
	let s = foldl (\acc x -> acc + m!x) 0 [1..n]
	print s