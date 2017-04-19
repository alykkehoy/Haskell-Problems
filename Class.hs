--defenitions:

--take n _ | n <=0 = []
--take _ [] = []
--take n (x:xs) = x : take (n - 1) xs

--repete x = x : repete x

--take 3 (repete "hello")
--  let s = "hello"
--  in let ss = repete s
--  in take 3 ss

--  let s = "hello"
--  in let ss1 = repete s
--  in let ss = s:ss1
--  in take 3 ss
--
--  let s = "hello"
--  in let ss1 = repete s
--  in take 3 (s:ss1)

--  let s = "hello"
--  in let ss1 = repete s
--  in s : take 2 ss1

--  let s = "hello"
--  in let ss2 = repete s
--  in let ss1 = s:ss2
--  in s:take 2 ss1
