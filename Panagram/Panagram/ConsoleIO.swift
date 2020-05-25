//
//  ConsoleIO.swift
//  Panagram
//
//  Created by Lahari Ganti on 5/25/20.
//  Copyright © 2020 Lahari Ganti. All rights reserved.
//

import Foundation

enum OutputType {
  case error
  case standard
}

class ConsoleIO {
  func writeMessage(_ message: String, to: OutputType = .standard) {
    switch to {
    case .standard:
      print("\u{001B}[;m\(message)")
    case .error:
       fputs("\u{001B}[0;31m\(message)\n", stderr)
    }
  }
  
  func printUsage() {
    let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
    
    writeMessage("usage:")
    writeMessage("\(executableName) -a string1 string2")
    writeMessage("or")
    writeMessage("\(executableName) -p string")
    writeMessage("or")
    writeMessage("\(executableName) -h to show usage information")
    writeMessage("Type \(executableName) without an option to enter interactive mode")
  }
  
  func getInput() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let stringData = String(data: inputData, encoding: String.Encoding.utf8)!
    return stringData.trimmingCharacters(in: .newlines)
  }
}
