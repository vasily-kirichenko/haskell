module Main where

import Data.Char (toUpper)
--import Control.Monad
import qualified Data.Vector as V

writeAsUpper :: FilePath -> String -> IO()
writeAsUpper path content = 
	writeFile path $ map toUpper content

main :: IO()
main = do
	content <- readFile "l:\\new_file.cpp"
	writeAsUpper "l:\\new_file.2.cpp" content
	putStrLn (map toUpper content)