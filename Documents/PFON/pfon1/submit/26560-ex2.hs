sumDigits :: Integer -> Integer
sumDigits n
    | n < 10 = n
    | otherwise = sumDigits(div n 10) + rem n 10

div3 :: Integer -> Bool
div3 n = (rem (sumDigits(n)) 3) == 0
