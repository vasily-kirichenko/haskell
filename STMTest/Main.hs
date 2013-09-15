module Main where

import Control.Concurrent
import Control.Concurrent.STM
import Control.Monad
import System.Environment (getArgs)

main :: IO ()
main = do
	nStr:_ <- getArgs
	let n = read nStr :: Int
	x <- atomically $ newTVar (0::Int)
	y <- atomically $ newTVar (0::Int)

	forM_ [1..n] $ atomically . \_ -> do 
		x' <- readTVar x
		y' <- readTVar y
		check (x' == y')
		writeTVar x (x' + 1)
		writeTVar y (y' + 1)

	print "Done."

threeTVarsWithWaiting :: IO ()
threeTVarsWithWaiting =	do
	vx:vy:_ <- atomically $ mapM newTVar [0, 0::Int]
	vz <- atomically $ newTVar (0::Int, 0)

	forkIO $ atomically $ do
		x <- readTVar vx
		y <- readTVar vy
		check (x > 0 && y > 1)
		writeTVar vz (x, y)

	forkIO $ atomically $ do 
		writeTVar vx 1
		writeTVar vy 2

	threadDelay 100000
	print =<< atomically (readTVar vz)
