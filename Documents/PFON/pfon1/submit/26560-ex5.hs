split1 :: [Integer] -> ([Integer], [Integer])
split1 [] = ([], [])
split1 xs =
  let
    len = length xs
    mid = len `div` 2
    (left, right) = splitAt mid xs
  in
    (left, right)

merge1 :: ([Integer], [Integer]) -> [Integer]
merge1([], xs) = xs
merge1(xs, []) = xs
merge1(x : xs, y : ys)
   | x < y = x : merge1(xs, y : ys)
   | otherwise = y : merge1(x : xs, ys)

mergesort :: [Integer] -> [Integer]
mergesort [] = []
mergesort [x] = [x]
mergesort xs =
  let
    (left, right) = split1 xs
  in
    merge1 (mergesort left, mergesort right)
