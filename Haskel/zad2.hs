--split []
--split [1]
--split [1,2]
--split [1,2,3,4]

split :: [a] -> ([a],[a])
split x = (getBySec x, getBySec (tail x))

getBySec :: [a] -> [a]
getBySec [] = []
getBySec x = l:getBySec r
    where l = head x
          r = drop 2 x
