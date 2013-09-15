{-# LANGUAGE RankNTypes, ExistentialQuantification #-}

module Main where

--object DbTask {
--  def retrieveOne(id: DocID): DbTask[Document] = SingleRetrieval(id)
--  def of[A](thing: A): DbTask[A] = ThisThingRightHere(thing)
--}


--instance DbTask DocID b where

--instance DbTask a where
--  func = 

--private case class SingleRetrieval(id: DocID) extends DbTask[DocID]
--private case class ThisThingRightHere[A](it: A) extends DbTask[A]

--private trait RecursiveDbTask[A] extends DbTask[A] {
--  def evaluate(how: DbTasker): A
--}

--private case class AndThen[A,B](start: DbTask[A], op: DbTask[A => B]) extends RecursiveDbTask[B] {
--  def evaluate(how: DbTasker): B = {
--    val microwave = how(op)
--    val food = how(start)
--    microwave(food)
--  }
--}

--class DbTask a where
--  apply :: (forall b . a -> b)

type DocID = Int
type DbTasker a = forall a . DbTask -> a

data DbTask 
  = SingleRetrieval DocID
  | ThisThingRightHere (forall a . a)
  | RecursiveDbTask (forall a . DbTasker a -> a)

apply :: forall a . DbTask -> a
apply (RecursiveDbTask r) = r apply
apply (SingleRetrieval id) = "Pretend I retrieved " ++ show id
apply (ThisThingRightHere it) = it

main :: IO ()
main = putStrLn "Done."