module Main where

groupConsecutive :: (Ord a, Num a) => [a] -> [[a]]
groupConsecutive = foldr group []
	where 
		group x [] = [[x]]
		group x acc@((h:t):rest)
			| h - x <= 1 = (x:h:t):rest
			| otherwise = [x]:acc

main :: IO()
main = print $ groupConsecutive [1, 2, 4, 5, 6, 9 :: Int]