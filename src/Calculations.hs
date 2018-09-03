module Calculations where

import Text.Printf
import Helpers
import Data.Decimal

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

lesson9 :: IO ()
lesson9 = do
  length <- askInt "Length of ceiling: "
  width <- askInt "Width of ceiling: "
  let area = fromIntegral $ length * width
  putStrLn $ "You will need " ++ (show $ gallonsRequired area) ++ " gallons of paint to cover " ++ (show $ round area) ++ " square feet."
  where
    gallonsRequired = ceiling . flip (/) 350
  
lesson10 :: IO ()
lesson10 = do
  i1p <- askInt "Price of item 1: "
  i1q <- askInt "Quantity of item 1: "
  i2p <- askInt "Price of item 2: "
  i2q <- askInt "Quantity of item 2: "
  i3p <- askInt "Price of item 3: "
  i3q <- askInt "Quantity of item 3: "
  let totalPrice = i1p * i1q + i2p * i2q + i3p * i3q
  let subtotal = roundTwo totalPrice
  let tax = (roundTwo totalPrice) * 0.055
  putStrLn $ "Subtotal: $" ++ (show $ subtotal)
  putStrLn $ "Tax: $" ++ (show $ tax)
  putStrLn $ "Total: $" ++ (show $ subtotal + tax)
  where
    roundTwo :: Int -> Decimal
    roundTwo = (realFracToDecimal 2) . fromIntegral

lesson11 :: IO ()
lesson11 = do
  euros <- askDouble "How many euros are you exchanging? "
  rate <- askDouble "What is the exchange range? "
  let dollars = realFracToDecimal 2 (euros * rate) 
  putStrLn $ (show $ round euros) ++ " euros at an exchange rate of " ++ (show rate) ++ " is "
  putStrLn $ (show dollars) ++ " U.S. dollars."

lesson12 :: IO ()
lesson12 = do
  principal <- askDouble "Loan principal: "
  interest <- askDouble "Rate of interest: "
  term <- askInt "Number of years: "
  let final = realFracToDecimal 2 $ (1 + (interest / 100) * (fromIntegral term)) * principal
  putStrLn $ "After " ++ (show term) ++
    " years at " ++ (show interest) ++
    "%, the investment" ++ " will be worth $" ++ (show final) ++ "."