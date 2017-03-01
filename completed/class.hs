--class Eq a where
--  (==) :: a -> a -> Bool
--  (/=) :: a -> a -> Bool

data Vec2 = Vec2 Int Int
instance Eq Vec2 where
  (Vec2 x1 y1) == (Vec2 x2 y2) =
    x1 == x2 && y1 == y2

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Ord, Show, Read)

instance Enum Day where
  toEnum 0 = Mon
  toEnum 1 = Tue
  toEnum 2 = Wed
  toEnum 3 = Thu
  toEnum 4 = Fri
  toEnum 5 = Sat
  toEnum 6 = Sun
  toEnum n = toEnum (mod n 6)

  fromEnum Mon = 0
  fromEnum Tue = 1
  fromEnum Wed = 2
  fromEnum Thu = 3
  fromEnum Fri = 4
  fromEnum Sat = 5
  fromEnum Sun = 6
