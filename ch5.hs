import Data.List

ifEven myFunction x = if even x
                      then myFunction x
                      else x
inc n = n + 1
double n = n*2
square n = n^2

ifEvenInc = ifEven inc
ifEvenDouble = ifEven double
ifEvenSquare = ifEven square

genIfEven f = ifEven f

genIfXEven x = (\f -> ifEven f x)

getRequestURL host apiKey resource id = host ++
                                        "/" ++
                                        resource ++
                                        "/" ++
                                        id ++
                                        "?token=" ++
                                        apiKey
genHostRequestBuilder host = (\apiKey resource id ->
                                getRequestURL host apiKey resource id)

genApiRequestBuilder hostBuilder apiKey resource = (\id ->
                                 hostBuilder apiKey resource id)

