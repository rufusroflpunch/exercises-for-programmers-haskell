module Lib where

import InputOutput
import Calculations

getLesson :: IO Int
getLesson = do
    putStr "Enter a lesson number: "
    numStr <- getLine
    let num = read numStr
    return num

runLesson :: Int -> IO ()
runLesson 1 = lesson1
runLesson 2 = lesson2
runLesson 3 = lesson3
runLesson 4 = lesson4
runLesson 5 = lesson5
runLesson 6 = lesson6
runLesson 7 = lesson7
runLesson _ = putStrLn "Lesson not found!"
