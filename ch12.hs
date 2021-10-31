type FirstName = String
type LastName = String
type Age = Int
type Height = Int
type PatientName = (String,String)

firstName :: PatientName -> String
firstName patient = fst patient

lastName :: PatientName -> String
lastName patient = snd patient

patientInfo :: PatientName -> Age -> Height -> String
patientInfo (fname, lname) age height = name ++ " " ++ ageHeight
 where name = lname ++ ", " ++ fname
       ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

patient1BT :: BloodType
patient1BT = BloodType A Pos

patient2BT :: BloodType
patient2BT = BloodType O Neg

patient3BT :: BloodType
patient3BT = BloodType AB Pos

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh)  = showABO abo ++ showRh rh

canDonateTo1 :: BloodType -> BloodType -> Bool
canDonateTo1 (BloodType O _) _ = True
canDonateTo1 _ (BloodType AB _) = True
canDonateTo1 (BloodType A _) (BloodType A _) = True
canDonateTo1 (BloodType B _) (BloodType B _) = True
canDonateTo1 _ _ = False --otherwise


type MiddleName = String
data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName

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

patientSummary:: PatientV2 -> String
patientSummary PatientV2{bloodType=bloodType} = showBloodType bloodType
