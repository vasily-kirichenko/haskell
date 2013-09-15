{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.Map                   as Map
import           Network.AMQP
import           Network.AMQP.Types
import           System.Environment         (getArgs)

main :: IO()
main = do
	conn <- openConnection "127.0.0.1" "/" "guest" "guest"
	chan <- openChannel conn
	--(testQueue, _, _) <- 
	declareQueue chan (aQueue "t2")

	let msg body = Message {
		msgBody = body,
		msgDeliveryMode = Just Persistent,
		msgTimestamp = Nothing,
		msgID = Just "theId",
		msgContentType = Nothing,
		msgReplyTo = Nothing,
		msgCorrelationID =	Nothing,
		msgHeaders = Nothing }

	let pub i = publishMsg chan "" "t2" (msg $ BL.pack $ show i)

	[nStr] <- getArgs
	let n = read nStr :: Int

	mapM_ pub [1..n]

	print "Done."

aQueue name =
	QueueOpts {
		queueName = name,
		queueAutoDelete = False,
	   	queueExclusive = False,
		queueDurable = True,
		queuePassive = False,
		queueHeaders = FieldTable Map.empty }
