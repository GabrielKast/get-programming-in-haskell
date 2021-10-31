data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Enum)
instance Show SixSidedDie where
   show S1 = "one"
   show S2 = "two"
   show S3 = "three"
   show S4 = "four"
   show S5 = "five"
   show S6 = "six"

instance Eq SixSidedDie where
   (==) S6 S6 = True
   (==) S5 S5 = True
   (==) S4 S4 = True
   (==) S3 S3 = True
   (==) S2 S2 = True
   (==) S1 S1 = True
   (==) _ _ = False

instance Ord SixSidedDie where
   compare S6 S6 = EQ
   compare S6 _  = GT
   compare _  S6 = LT
   compare S5 S5 = EQ
   compare S5 _  = GT
   compare _  S5 = LT
   compare S4 S4 = EQ
   compare _  S4 = LT
   compare S4 _  = GT
   compare S3 S3 = EQ
   compare _  S3 = LT
   compare S3 _  = GT
   compare S2 S2 = EQ
   compare _  S2 = LT
   compare S2 _  = GT
   compare S1 S1 = EQ

data Test1 = AA | ZZ deriving (Eq, Ord)
data Test2 = ZZZ | AAA deriving (Eq, Ord)

-- instance Enum SixSidedDie where
--    toEnum 0 = S1
--    toEnum 1 = S2
--    toEnum 2 = S3
--    toEnum 3 = S4
--    toEnum 4 = S5
--    toEnum 5 = S6
--    toEnum _ = error "No such value"

--    fromEnum S1 = 0
--    fromEnum S2 = 1
--    fromEnum S3 = 2
--    fromEnum S4 = 3
--    fromEnum S5 = 4
--    fromEnum S6 = 5

data Name = Name (String, String) deriving (Show, Eq)
type Name = (String,String)

names :: [Name]
names = [ ("Emil","Cioran")
        , ("Eugene","Thacker")
        , ("Friedrich","Nietzsche")]

