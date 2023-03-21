//
//  File.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Foundation

func main(args: [String]) {
  switch args.count {
  case 1: Swlox.runPromt()
  case 2:
    do {
      try Swlox.runFile(args[1])
    } catch {
      print("failed to run file")
    }
  default:
    print("Usage: swlox [filepath]")
    exit(64)
  }
}

main(args: CommandLine.arguments)
