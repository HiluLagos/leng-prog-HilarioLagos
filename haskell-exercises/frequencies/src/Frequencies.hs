module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap)

type Frequency = (Int, Char)

frequencies::String -> [Frequency]
frequencies (x:xs) = error "implement it"

frequencyMap :: (Ord a) => [a] -> Map a Int
frequencyMap xs = getMap xs Map.empty
  where
    getMap [] mp = mp
    getMap (x:xs) mp = go xs (Map.insertWith (+) x 1 mp)

insert::(Ord a) => a -> [a] -> [a]
insert = error "Implement it"

insertionSort :: (Ord a) => [a] -> [a]
insertionSort = error "Implement it"