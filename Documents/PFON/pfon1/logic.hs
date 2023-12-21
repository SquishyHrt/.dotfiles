main :: IO()
main = putStrLn("Hello World")

andOP :: Bool -> Bool -> Bool
andOP a b = if a == b
                then if a == False then False
                else True
            else False


orOP :: Bool -> Bool -> Bool
orOP a b = if a == b
                then if a == False then False
                else True
            else True

imply :: Bool -> Bool -> Bool
imply a b = (orOP(not(a), b))
