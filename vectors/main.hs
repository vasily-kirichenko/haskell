module Main where

import qualified Data.Vector as V

main :: IO()
main = do
	let v = join $ new 10
	print $ show v
	print $ show v