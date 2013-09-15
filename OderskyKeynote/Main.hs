module Main where

data EntryKind = CpeSource deriving (Eq, Show)
type Path = String
type Member = String

data Entry = Entry
    { entryKind :: EntryKind,
      path :: Path }
    deriving Show

findMembers :: Path -> [Member]
findMembers _ = ["m1", "m2"]

getRawClasspath :: [Entry]
getRawClasspath = [Entry { entryKind = CpeSource, path = "path1" }]

main :: IO()
main =
	print
	$ concatMap (findMembers . path) 
	$ filter ((==) CpeSource . entryKind)
	getRawClasspath
