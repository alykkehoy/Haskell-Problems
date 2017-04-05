--given a list of words find the longest word
findLongest :: [String] -> String -> String
findLongest [] l = l
findLongest (x:xs) l
  | length l > length x = findLongest xs l
  | otherwise = findLongest xs x

longestWord :: [String] -> String
longestWord = foldr longerWord ""
  where longerWord w1 w2 | length w1 > length w2 = w1
                         | otherwise = w2

--write a recuseive funtion that will set the value at a given incex within a list
setElementAt :: a -> Int -> [a] -> [a]
setElementAt _ _ [] = []
setElementAt a 0 as = a : (tail as)
setElementAt a n as
  | n > 0 = (head as) : setElementAt a (n - 1) (tail as)
  | othwerise = error "negative index"


--define a sum type to represent a six-sided die.
--card(SixSidededDie) = 6
data SixSidedDie = One | Two | Three | Four | Five | Six
  deriving (Show, Read, Eq, Ord, Bounded, Enum)

--define a product type to represent a simplifed verion of a magic the gathering playing card.
--Each card should have a name, color(white, black, blue, green, red) and integer power and toughness.
--card(Color) = 5
data Color = White | Black | Blue | Green | Red

--card(MTGCard) = card(String) * card(Color) * card(Int) * card(Int) = infinite
--card(Int) = 2^64
data MTGCard = MTGCard {
  name :: String,
  color :: Color,
  power :: Int,
  toughness :: Int
  }
