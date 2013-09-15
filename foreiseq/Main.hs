module Main where

fareiSeq :: Int -> [(Int, Int)]
fareiSeq n = loop [] n 0 1 1 1
	where
    	loop acc n' x y z t =
        	let a = x + z
        	    b = y + t
        	in if b <= n' then
        		loop ((a,b):acc) n' x y a b
			else acc
    
    --printfn "%d / %d" 1 1

main :: IO()
main = mapM_ print $ fareiSeq 10