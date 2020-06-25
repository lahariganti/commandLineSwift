//
//  Hangman.swift
//  
//
//  Created by Lahari Ganti on 6/25/20.
//

import Foundation

let word = "RYTHM"
var usedLetters = [Character]()

print("Welcome to Hangman")
print("Press a letter to guess, or Ctrl+D to quit")

func printWord() {
  print("\nWord: ", terminator: "")
  var missingLetters = false
  
  for letter in word {
    if usedLetters.contains(letter) {
      print(letter, terminator: "")
    } else {
      print("_", terminator: "")
      missingLetters = true
    }
  }
  
  print("\nGuesses: \(usedLetters.count)/8")
  
  if missingLetters == false {
    print("It looks like you live on... for now.")
    exit(0)
  } else {
    if usedLetters.count == 8 {
      print("Oops – you died! The word was \(word).")
      exit(0)
    } else {
      print("Enter a guess: ", terminator: "") }
  }
}

while let input = readLine() {
  if let letter = input.uppercased().first {
    if usedLetters.contains(letter) {
      print("You used that letter already!")
    } else {
      usedLetters.append(letter)
    }
  }
  
  printWord()
}

print("Thanks for playing!")
exit(0)
