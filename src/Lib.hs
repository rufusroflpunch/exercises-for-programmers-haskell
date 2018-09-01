module Lib where

getLesson :: IO Int
getLesson = do
    putStr "Enter a lesson number: "
    numStr <- getLine
    let num = read numStr
    return num

runLesson :: Int -> IO ()
runLesson 1 = lesson1
runLesson 2 = lesson2
runLesson _ = putStrLn "Lesson not found!"

lesson1 :: IO ()
lesson1 = do
    putStrLn "What is your name? "
    name <- getLine
    putStrLn ("Hello there, " ++ name)

lesson2 :: IO ()
lesson2 = do
    putStr "What is the input string? "
    name <- getLine
    putStrLn (name ++ " has " ++ (show $ length name) ++ " characters.")