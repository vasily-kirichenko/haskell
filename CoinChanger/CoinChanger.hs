module Main where

data Coin 
	= TwentyFive
	| Ten
	| Five
	| One
	deriving Show

value :: Coin -> Int
value TwentyFive = 25
value Ten = 10
value Five = 5
value One = 1

makeChange :: Int -> [Coin]
makeChange amount = doChange amount [] [TwentyFive, Ten, Five, One]
	where
    	doChange amount' soFar coins = 
        	case coins of
        		(coin:_)
        			| amount' >= value coin -> doChange (amount' - value coin) (coin:soFar) coins
        		(_:rest) -> doChange amount' soFar rest
        		[] -> reverse soFar

main :: IO()
main = 
	putStrLn 
	$ foldl (\acc x -> acc ++ x ++ "\n") ""
	$ map (\x -> show x ++ " -> " ++ show (makeChange x))
	[1..120]

	-- $ foldl (\acc x -> acc ++ "\n" ++ show x ++ " -> " ++ show (makeChange x)) "" [0..10]