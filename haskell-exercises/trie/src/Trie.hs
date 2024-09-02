module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a = Leaf a | Trie a :-: Trie a deriving (Eq, Show)
            
left::Trie a -> Trie a
left (Leaf a) = error "leaf does not have children"
left (l :-: _) = l

right::Trie a -> Trie a
right (Leaf a) = error "leaf does not have children"
right (_ :-: r) = r


-- Si recibo un F voy a izquierda y si T voy a derecha
find::Bits -> Trie a -> a
find [] (Leaf e) = e
find [] (_ :-: _) = error "Only leaf holds values"
find (x:xs) tree = if x == F then find xs (left tree) else find xs (right tree)


decode::Bits -> Trie Char -> String
decode xs tree = decodeLoop xs tree tree

decodeLoop::Bits -> Trie Char -> Trie Char -> String
decodeLoop [] (Leaf e) _ = [e]
decodeLoop [] (_ :-: _) _ = error "Only leaf has values"
decodeLoop xs (Leaf e) og = [e] ++(decodeLoop xs og og)
decodeLoop (x:xs) tree og = if x == F then decodeLoop xs (left tree) og else decodeLoop xs (right tree) og

-- while(no hoja) -> do 1. left ls + f 2. right ls + t
toList::Trie a -> [(a, Bits)]
toList t =  [] ++ search t []
    where
        search:: Trie a -> Bits -> [(a, Bits)]
        search (Leaf e) bits = [(e, bits)]
        search tree bits = (search (left tree) (bits ++ [F])) ++ (search (right tree) (bits ++ [T]))
