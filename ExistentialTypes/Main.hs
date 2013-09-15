{-# LANGUAGE ExistentialQuantification #-}

module Main where

class HasMass_ a where
	weight :: a -> Weight

data HasMass = forall a. HasMass_ a => HasMass a

type Radius = Double
data Sphere = Sphere Radius

data Material = Wood | Metal
data Ball = Ball Radius Material
type Weight = Double

instance HasMass_ Sphere where
	weight (Sphere r) = pi * r**3

instance HasMass_ Ball where
	weight (Ball r material) =
		case material of
			Wood -> volume * 2.5
			Metal -> volume * 11.0
		where volume = pi * r**3

instance HasMass_ HasMass where
	weight (HasMass a) = weight a

sphere :: Radius -> HasMass
sphere r = HasMass $ Sphere r

ball :: Radius -> Material -> HasMass
ball r m = HasMass $ Ball r m

totalWeight :: HasMass_ a => [a] -> Weight
totalWeight = foldr ((+) . weight) 0.0

main :: IO()
main = do
	let xs = [sphere 2, ball 3 Wood]
	print $ totalWeight xs