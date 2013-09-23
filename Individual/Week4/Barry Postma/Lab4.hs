module Lab4

where

import Data.List
import SetOrd
import Week3

{-|
	Exercise 2
	Duration: 1hr because of trouble with IO again... :)
-}
randomSet :: IO (Set Int)
randomSet = do
			intl <- getIntList'
			return (list2set intl)
			
{-|
	Exercise 3.1
-}
intersection :: Eq a => (Set a) -> (Set a) -> (Set a)
intersection (Set s1) (Set s2) = Set (intersect s1 s2)

