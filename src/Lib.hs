module Lib where

import Data.Time
import Helpers

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
runLesson _ = putStrLn "Lesson not found!"

lesson1 :: IO ()
lesson1 = do
    putStrLn "What is your name? "
    name <- getLine
    putStrLn ("Hello there, " ++ name)

lesson2 :: IO ()
lesson2 = do
    name <- ask
    putStrLn (name ++ " has " ++ (show $ length name) ++ " characters.")
    where
        ask = do
            putStr "What is the input string? "
            inp <- getLine
            case (length inp) of
                0 -> do
                    putStrLn "You must enter a value."
                    ask
                _ -> return inp

lesson3 :: IO ()
lesson3 = do
    putStr "What is the quote? "
    quote <- getLine
    putStr "Who said it? "
    person <- getLine
    putStrLn $ person ++ " says, " ++ (show quote) 

lesson4 :: IO ()
lesson4 = do
    noun <- ask "Enter a noun: "
    verb <- ask "Enter a verb: "
    adjective <- ask "Enter an adjective: "
    adverb <- ask "Enter an adverb: "
    putStrLn $ "Do you " ++ verb ++ " your " ++ noun ++ " " ++ adverb ++ "? That's " ++ adjective
    where
        ask question = do
            putStr question
            getLine

lesson5 :: IO ()
lesson5 = do
    numOne <- askInt "First number: "
    numTwo <- askInt "Second number: "
    putStrLn $ (show numOne) ++ " + " ++ (show numTwo) ++ " = " ++ (show $ numOne + numTwo)
    putStrLn $ (show numOne) ++ " - " ++ (show numTwo) ++ " = " ++ (show $ numOne - numTwo)
    putStrLn $ (show numOne) ++ " * " ++ (show numTwo) ++ " = " ++ (show $ numOne * numTwo)
    putStrLn $ (show numOne) ++ " / " ++ (show numTwo) ++ " = " ++ (show $ numOne `quot` numTwo)

lesson6 :: IO ()
lesson6 = do
    currentAge <- askInt "What is your current age? "
    retirementAge <- askInt "What is youre retirement age? "
    let yearsToRetirement = retirementAge - currentAge
    putStrLn $ "You have " ++ (show $ yearsToRetirement) ++ " left until you can retire."
    if yearsToRetirement <= 0
        then putStrLn "You can retire now!"
        else do
            utc <- getCurrentTime
            let (year, _, _) = toGregorian $ utctDay utc
            putStrLn $ "It's " ++ (show year) ++ ", so you can retire in " ++ (show $ (+) year $ fromIntegral yearsToRetirement)
