module Helpers where

ask :: String -> IO String
ask question = do
  putStr question
  getLine

askInt :: String -> IO Int
askInt question = do
  putStr question
  fmap (read :: String -> Int) getLine

askDouble :: String -> IO Double
askDouble question = do
  putStr question
  fmap (read :: String -> Double) getLine