elementAt (x:_) 1 = x
elementAt (_:xs) n = elementAt xs (n-1)
elementAt _ _ = error "ERROR"  