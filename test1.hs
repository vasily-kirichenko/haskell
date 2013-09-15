xs1 = [(x, y) | x <- [1..10], y <- [10..20], odd (x + y)]
xs2 = [if odd (x + y) then (x, y) else (-1, -1) | x <- [1..10], y <- [10..20]]
xs3 = [(a,b,c) | a <- [1..10], b <- [1..a], c <- [1..b]]

data My = My Int
          deriving (Show, Ord)

instance Eq My where
  (==) (My x) (My y) = x == y

my1 = My 2
my2 = My 3

m1 mapF filterF xs = map mapF (filter filterF xs)
m2 mapF filterF = map mapF . filter filterF
