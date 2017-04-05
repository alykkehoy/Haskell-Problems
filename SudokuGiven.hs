import System.Environment
import System.IO

{- DSL types for this Sudoku problem -}

type Matrix a = [Row a]
type Row a = [a]
type Grid = Matrix Digit
type Digit = Char
type Choices = [Digit]

digits :: Choices
digits = ['1'..'9']

blank :: Digit -> Bool
blank = (== '0')

{- Main and brute-force solver -}

solve :: Grid -> [Grid]
solve = filter valid . expand . choices

main :: IO ()
main = do
    solutions <- return $ solve $ testPuzzle
    putStrLn $ concat $ head solutions
    print "Done!"

{- Component functions of the brute-force solver -}

choices :: Grid -> Matrix Choices
choices = map $ map choice
  where
    choice d = if blank d then digits else [d]

expand :: Matrix Choices -> [Grid]
expand = cp . map cp

valid :: Grid -> Bool
valid g = all nodups (rows g) && all nodups (cols g) && all nodups (boxs g)

{- Auxiliary functions for the above components -}

cp :: [[a]] -> [[a]]
cp [] = [[]]
cp (xs:xss) = [x:ys | x <- xs, ys <- cp xss]

rows :: Matrix a -> Matrix a
rows = id

cols :: Matrix a -> Matrix a
cols [xs] = [[x] | x <- xs]
cols (xs:xss) = zipWith (:) xs (cols xss)

boxs :: Matrix a -> Matrix a
boxs = map ungroup . ungroup . map cols . group . map group

nodups :: Eq a => Row a -> Bool
nodups [] = True
nodups (x:xs) = all (/= x) xs && nodups xs

group :: [a] -> [[a]]
group [] = []
group xs = take 3 xs : group (drop 3 xs)

ungroup :: [[a]] -> [a]
ungroup = concat

testPuzzle = [
    "603719458",
    "708624931",
    "491803276",
    "569178342",
    "837542169",
    "140936587",
    "314287095",
    "975361804",
    "286490713"
    ]
easyPuzzle = [
    "603000408",
    "008024930",
    "400000076",
    "060070042",
    "030502060",
    "140030080",
    "310000005",
    "075360800",
    "206000703"
    ]
mediumPuzzle = [
    "030006025",
    "600903008",
    "109008600",
    "500007000",
    "060000040",
    "000400002",
    "008300109",
    "300709004",
    "290500030"
    ]
hardPuzzle = [
    "009008003",
    "000300090",
    "000420500",
    "000014362",
    "040000080",
    "321680000",
    "006071000",
    "010002000",
    "800900700"
    ]
evilPuzzle = [
    "009050010",
    "056002000",
    "840000230",
    "000069000",
    "500000008",
    "000420000",
    "012000073",
    "000200680",
    "090070400"
    ]

main1 = do
    putStr "Choose difficulty - (E)asy, (M)edium, (H)ard, E(V)il: "
    hFlush stdout
    selection <- getLine
    solution <- return $ case selection of "E" -> solve easyPuzzle
                                           "M" -> solve mediumPuzzle
                                           "H" -> solve hardPuzzle
                                           "V" -> solve evilPuzzle
    print solution

fromString "" = []
fromString s = (take 9 s):(fromString $ drop 9 s)

main2 = do
    [f] <- getArgs
    s <- readFile f
    puzzles <- return $ fmap fromString (lines s)
    solveAll puzzles
    print "Done!"
    where solveAll [] = return ()
          solveAll (p:pz) = do
              solution <- return $ solve p
              solution <- return $ solve p
              putStrLn $ concat $ head solution
              solveAll pz

