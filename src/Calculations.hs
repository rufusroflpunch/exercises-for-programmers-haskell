module Calculations where

import Text.Printf
import Helpers

lesson7 :: IO ()
lesson7 = do
  length <- fmap fromIntegral $ askInt "Length of room in feet: "
  width <- fmap fromIntegral $ askInt "Width of room in feet: "
  putStrLn $ "You entered dimensions of " ++ (show length) ++ " feet by " ++ (show width) ++ " feet."
  putStrLn "The area is:"
  putStrLn $ "    " ++ (show $ length * width) ++ " square feet"
  putStrLn $ "    " ++ (printf "%.2f" $ sqFtToSqM $ length * width) ++ " square meters"
  where
    sqFtToSqM :: Double -> Double
    sqFtToSqM = flip (/) 10.7639

lesson8 :: IO ()
lesson8 = do
  people <- askInt "How many people: "
  pizzas <- askInt "How many pizzas: "
  slicesPerPizza <- askInt "Slices per pizza: "
  let totalSlices = pizzas * slicesPerPizza
  let slicesPerPerson = totalSlices `div` people
  let leftoverPieces = totalSlices `mod` people
  putStrLn $ (show people) ++ " people with " ++ (show pizzas) ++ " " ++ (pluralPizza pizzas) ++ "."
  putStrLn $ "Each person gets " ++ (show slicesPerPerson) ++ " "++ (pluralPiece slicesPerPerson) ++ " of pizza."
  putStrLn $ "There are " ++ (show leftoverPieces) ++ " leftover " ++ (pluralPiece leftoverPieces) ++ " pieces."
  where pluralPizza n = if n > 1 || n == 0 then "pizzas" else "pizza"
        pluralPiece n = if n > 1 || n == 0 then "pieces" else "piece"