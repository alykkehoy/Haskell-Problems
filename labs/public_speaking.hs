module Main where


main = do
  x <- readLn
  ss <- getTranscripts x
  checkTranscripts ss
  return ()

getTranscripts :: Int ->IO [String]
getTranscripts 0 = return []
getTranscripts n = do
  line <- getLine
  line2 <- getTranscripts (n - 1)
  return (line : line2)

isFiller :: String -> Bool
isFiller "er" = True
isFiller "um" = True
isFiller "uh" = True
isFiller _ = False

countFiller :: [String] -> Int
countFiller [] = 0
countFiller (w:ws) =
  if isFiller w
     then 1 + countFiller ws
     else countFiller ws

--countFiller (w:ws)
--    | isFiller w = 1 + n
--    | otherwise = n
--  where
--    n = countFiller ws

checkTranscript :: String -> String
checkTranscript s
  | n > 5 =  "nervous"
  | otherwise = "calm"
  where n = countFiller ( words s )

checkTranscripts :: [String] -> IO ()
checkTranscripts [] = return ()
checkTranscripts (s:ss) = do
  putStrLn ( checkTranscript s )
  checkTranscripts ss
