## GHCi
 - To know a type: :t
 - To have details on a type or a class: :info.


## Grammar

### Type alias
```
type Name = String
type Name = (String,String) -- tuple
```

### data types

```
data Sex = Male | Female
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType
data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName
```

#### With records.

```
data PatientV2 = PatientV2 { name :: Name
                           , sex :: Sex
                           , age :: Int
                           , height :: Int
                           , weight :: Int
                           , bloodType :: BloodType }
jackieSmith :: PatientV2
jackieSmith = PatientV2 {name = Name "Jackie" "Smith"
                        , age = 43
                        , sex = Female
                        , height = 62
                        , weight = 115
                        , bloodType = BloodType O Neg }

canDonateTo:: PatientV2 -> PatientV2 -> Bool
canDonateTo PatientV2{bloodType = BloodType O _} _ = True
canDonateTo _ PatientV2{bloodType=BloodType AB _} = True
canDonateTo PatientV2{bloodType=BloodType A _} PatientV2{bloodType=BloodType A _} = True
canDonateTo PatientV2{bloodType=BloodType B _} PatientV2{bloodType=BloodType B _} = True
canDonateTo _ _ = False --otherwise
```

### Types classes
Use `class .. where (funs...)`.  
```
class Describable a where
   describe :: a -> String
```

Common type classes: Ord, Eq, Bounded (with bounds. It's the difference between Int (bounded) and Integer), Show, Num

How to define a data type with a type class:  
```
data Icecream = Chocolate | Vanilla deriving (Show)
data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)
```

Implementing a data type: use `instance`  
```
data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6
instance Show SixSidedDie where
   show S1 = "one"
   show S2 = "two"
   show S3 = "three"
   show S4 = "four"
   show S5 = "five"
   show S6 = "six"
```
Or use default methods by deriving:  
```
data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving(Show, Eq, Ord)
```

To Implement Enum just 2 methods to write: toEnum and fromEnum.  
```
instance Enum SixSidedDie where
   toEnum 0 = S1
   toEnum 1 = S2
   toEnum 2 = S3
   toEnum 3 = S4
   toEnum 4 = S5
   toEnum 5 = S6
   toEnum _ = error "No such value"

   fromEnum S1 = 0
   fromEnum S2 = 1
   fromEnum S3 = 2
   fromEnum S4 = 3
   fromEnum S5 = 4
   fromEnum S6 = 5

-- So you can use it:
[S1 .. S6]
-- But not [S1 .. ] leads to an error.  No error if you use deriving(Enum)
```

```
data Name = Name (String, String) deriving (Show, Eq)
instance Ord Name where
   compare (Name (f1,l1)) (Name (f2,l2)) = compare (l1,f1) (l2,f2)
```

### Type synonym.
Alternative to data Name = ... Even tstringer as it defines a type. But you can do only one type constructor.
```
newtype Name = Name (String, String) deriving (Show, Eq)
```
