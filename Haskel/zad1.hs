-- scalarproduct [1,2,3] [3,2,1]
-- scalarproduct [1,0] [0,1]
-- scalarproduct [1,2] [3,4]

scalarproduct a b = (scalarproduct' (zip a b))
scalarproduct' a = sum [ x * y | (x, y) <- a]

