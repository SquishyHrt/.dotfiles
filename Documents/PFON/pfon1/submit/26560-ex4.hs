syracus :: Integer -> Integer
syracus n
    | even n = div n 2
    | otherwise  = 3 * n + 1

syracuselist :: Integer -> [Integer]
syracuselist 1 = [1]
syracuselist n = n : syracuselist(syracus(n))
