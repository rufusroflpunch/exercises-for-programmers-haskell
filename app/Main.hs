module Main where

import Lib

main :: IO ()
main = do
  lesson <- getLesson
  runLesson lesson