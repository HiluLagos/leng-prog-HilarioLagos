
-- Given a string returns tuple with continuous occurrences of chars
encode :: String -> [(Int, Char)]
encode [] = []
encode (x:xs) = encodeLoop xs x 0
    where
        encodeLoop:: String -> Char -> Int -> [(Int, Char)]
        encodeLoop [] c n = [(n, c)]
        encodeLoop (x:xs) c n = if(x == c) then encodeLoop xs c (n+1) else [(n, c)] ++ encodeLoop xs x 1


data Element = One Char | Repeat Char Int

-- same as encode but using element and list comprehension
encode2::String -> [Element]
encode2 xs = [buildElement pair | pair <- encode xs]
    where
        buildElement:: (Int, Char) -> Element
        buildElement (n, c) = if (n == 1) then One c else Repeat c n



+