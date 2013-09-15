module Main where

import           System.Time

data Interval
    = Hour
    | Hours Int
    | Day
    | Days Int

data Direction
	= Ago
    | InTheFuture

getDate :: Interval -> Direction -> IO CalendarTime
getDate interval direction = do
	now <- getClockTime
	let x = add (direct getShift) now
	toCalendarTime x
	where
		add (days, hours) =
			addToClockTime TimeDiff { tdYear = 0, tdMonth = 0, tdDay = days,
									  tdHour = hours, tdMin = 0, tdSec = 0, tdPicosec = 0 }
		getShift =
			case interval of
				Hour -> (0, 1)
				Hours x -> (0, x)
				Day -> (1, 0)
				Days x -> (x, 0)

		direct shift@(days, hours) =
			case direction of
				Ago -> (-days, -hours)
				InTheFuture -> shift

main :: IO()
main = do
	date <- getDate (Days 6) Ago
	print date
