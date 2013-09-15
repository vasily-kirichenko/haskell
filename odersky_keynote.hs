data EntryKind =
    CpeSource
    deriving Show

data Desc = Desc
    { level :: Int,
      content :: String }
    deriving Show

data Entry = Entry
    { kind :: EntryKind,
      path :: String,
      desc :: Desc }
    deriving Show


--findMember path = [()]

--getRawClasspath :: () -> [Entry]

--getRawClasspath() = []

--res :: () -> [Entry]
--res () = concat
  --           (\entry { path = path } -> findMember path)
    --         $ filter (\entry@Entry { kind = kind } ->
      --                     case kind of
        --                     CpeSource -> True
          --                   _ -> False) (getRawClasspath())
