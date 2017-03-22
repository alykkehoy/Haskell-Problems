type Digit = Char
type Row a = [a]
type Matrix a = [Row a]
type Grid = Matrix Digit
type Choices = [Digit]

digits :: Choices
digits = ['1'..'9']

blank :: Digit -> Bool
blank = (=='0')

choices :: Grid -> Matrix Choices
choices = map (map choice)
  where
    choice d = if blank d
                  then digits
                  else [d]

expand :: Matrix Choices -> [Grid]
expand = cp . (map cp)
  where
    cp [] = [[]]
    cp (xs:xss) = [x : ys | x <- xs, ys <- cp xss]

valid :: Grid -> Bool
valid g = all noDups (rows g) && all noDups (cols g) && all noDups (boxes g)
  where
    rows a = a
    cols [xs] = [[x] | x <- xs]
    cols (xs:xss) = zipWith (:) xs (cols xss)
    boxes = map concat . concat . map cols . group . map group

group :: [a] -> [[a]]
group [] = []
group xs = take 3 xs : group (drop 3 xs)

noDups :: Row Digit -> Bool
noDups [] = True
noDups (x:xs)
  | x `elem` xs = False
  | otherwise = noDups xs

solve :: Grid -> [Grid]
solve = filter valid . expand . choices

main :: IO()
main =
  return ()
