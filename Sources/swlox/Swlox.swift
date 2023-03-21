//
//  Swlox.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Foundation

struct Swlox {
  static func runPromt() {
    while(true) {
      print("> ", terminator: "")
      guard let line = readLine() else { break }
      run(source: line)
    }
  }
  
  static func runFile(_ path: String) throws {
    let string = try String(contentsOfFile: path)
    run(source: string)
  }
}

private extension Swlox {
  static func run(source: String) {
    let scanner = Scanner(source: source)
    let tokens = scanner.scanTokens()
    for token in tokens {
      print(token)
    }
  }
}
