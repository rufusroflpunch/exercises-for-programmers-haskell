.PHONY: ghcid build run

ghcid:
	ghcid --command="stack ghci" -o "ghcid.txt"

build:
	stack build

run: build
	stack runhaskell app/Main.hs