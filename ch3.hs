sumSquareOrSquareSum x y = body (x^2 + y^2)((x+y)^2)  
        
body = (\ sumSquare squareSum -> if sumSquare > squareSum
                                 then sumSquare
                                 else squareSum)

doubleDouble x = (\d -> d*2) (x*2)

overwrite x = let x = 2
              in
               let x = 3
               in
                let x = 4
                in
                 x
overwrite_lambdas x = let x = 2
                      in
                        let x = 3
                        in
                          let x = 4
                          in
                            x
