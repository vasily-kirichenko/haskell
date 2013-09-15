module Main where

import Data.Sequence as Seq
import Data.Foldable as Foldable

main :: IO ()
main = do
	let s = Seq.fromList [1,2::Int]
	let	s1 = s >< Seq.fromList [3,4]
	let sum' = Foldable.foldl (+) 0 s1
	print (s, s1, sum')