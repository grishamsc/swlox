//
//  Swlox.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Foundation

struct Swlox {
  static var hadError = false;
  
  static func runPromt() {
    while(true) {
      print("> ", terminator: "")
      guard let line = readLine() else { break }
      run(source: line)
      hadError = false
    }
  }
  
  static func runFile(_ path: String) throws {
    let string = try String(contentsOfFile: path)
    run(source: string)
  }
  
  static func error(line: Int, message: String) {
    report(line: line, where: "", message: message)
  }
}

private extension Swlox {
  static func run(source: String) {
    let scanner = Scanner(source: source)
    let tokens = scanner.scanTokens()
    for token in tokens {
      print(token)
    }
    if hadError { exit(65) }
  }
  
  static func report(line: Int,
                     where: String,
                     message: String) {
    let output = "[line: \(line)] Error \(`where`): \(message)"
    var standartError = StderrOutputStream()
    print(output, to: &standartError)
  }
}
