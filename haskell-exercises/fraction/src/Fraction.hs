module Fraction (Fraction, add, sub, mul, divide, hcf, simpl) where

type Fraction = (Int, Int)

-- simplify method
simpl :: Fraction -> Fraction
simpl (n, d) = if hf > 1 then (n `div` hf, d `div` hf) else (n, d)
  where
    hf = hcf n d

-- Implement the `add` Function
add :: Fraction -> Fraction -> Fraction
add (n1, d1) (n2, d2) = if d1 == d2 then simpl (n1+n2, d1) else simpl (n1*d2 + n2*d1, d1*d2)

-- Implement the `sub` Function
sub :: Fraction -> Fraction -> Fraction
sub (n1, d1) (n2, d2) = if d1 == d2 then simpl (n1-n2, d1) else simpl (n1*d2 - n2*d1, d1 * d2)

-- Implement the `mul` Function
mul :: Fraction -> Fraction -> Fraction
mul (n1, d1) (n2, d2) = simpl (n1 * n2, d1 * d2)

-- Implement the `divide` Function
divide :: Fraction -> Fraction -> Fraction
divide (n1, d1) (n2, d2) = simpl (n1 * d2, d1 * n2)

-- Implement the `hcf` Function
hcf :: Int -> Int -> Int
hcf n d = gcd n d