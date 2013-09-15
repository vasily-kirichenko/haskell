module Main where

import Text.Parsec

parseCSV :: String -> Either ParseError [[String]]
parseCSV = parse csvFile "(unknown)"
	where 
		csvFile = endBy line eol
		line = sepBy cell (char ',')
		cell = quotedCell <|> many (noneOf ",\n\r")

		quotedCell = do
			char '"'
			content <- many quotedChar
			char '"' <?> "quote at end of cell"
			return content

		quotedChar = noneOf "\"" <|> try (string "\"\"" >> return '"')

		eol =     try (string "\n\r")
			  <|> try (string "\r\n")
			  <|> string "\n"
			  <|> string "\r"
			  <?> "end of line"

main :: IO ()
main = 
	print $ parseCSV "1,\"2,22\",3\na,bb,ccc\n\r4,5,6\rd,e,f\r\n"