module Lists (member, union, intersection, difference,
              insert, insertionSort,
              binaryToDecimal, toDecimal, toDec, decimal, firsts,
              binaryAdd) where
  
import Data.Char(digitToInt)  

member:: Int -> [Int] -> Bool
member _ []      = False
member e (x:xs)  = e == x || member e xs


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys
union (x:xs) ys 
  | member x ys = union xs ys
  | otherwise   = x : union xs ys

-- Remove Implementations, from, here on

intersection:: [Int] -> [Int] -> [Int]
intersection [] _ = []
intersection _ [] = []
intersection (x:xs) ys = if elem x ys then [x] ++ listInt else [] ++ listInt
  where
    listInt = intersection xs ys


difference:: [Int] -> [Int] -> [Int]
difference [] _ = []
difference xs [] = xs
difference (x:xs) ys = if elem x ys then [] ++ listDiff else [x] ++ listDiff
  where
    listDiff = difference xs ys

-- Assuming Ordered List
insert:: Int -> [Int] -> [Int]
insert n [] = [n]
insert n (x:xs)  = if n < x then n : x : xs else x : insert n xs

-- Takes element and compares it to the one on the left, moves it until left is <
insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
-- insertionSort (x:xs) = foldr insert x xs

binaryToDecimal :: [Int] -> Int
binaryToDecimal [] = 0
binaryToDecimal (x:xs) = x * (2^(length xs)) + binaryToDecimal xs
    
toDecimal :: Int -> [Int] -> Int
toDecimal _ [] = 0
toDecimal b (x:xs) = x * (b^(length xs)) + toDecimal b xs
    
toDec::Int -> String -> Int
toDec base s = toDecimal base s2
  where s2 = map digitToInt s

-- Same as `toDec` But use a list comprehension

decimal::Int -> String -> Int
decimal base s = toDecimal base s2
  where s2 = map digitToInt s

firsts::[a] -> [[a]]
firsts [] = [[]]
firsts (x:xs) = [first2 : (x:xs)]
  where first2::

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"