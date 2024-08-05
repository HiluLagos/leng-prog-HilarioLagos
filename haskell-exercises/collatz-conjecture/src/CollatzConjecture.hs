module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | n == 1 = Just 0
  | otherwise = if n `mod` 2 == 0
                then fmap (+1) (collatz (n `div` 2))
                else fmap (+1) (collatz (3 * n + 1))