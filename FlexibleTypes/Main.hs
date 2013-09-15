{-# LANGUAGE FlexibleInstances #-}

module Main where

import Control.Applicative ((<$>))

main :: IO ()
main = do
	let zai = Right "zai" :: Either Int String
	print $ (++ "!") <$> zai