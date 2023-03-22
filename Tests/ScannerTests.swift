//
//  ScannerTests.swift
//  
//
//  Created by Grigory on 22.3.23..
//

import XCTest
@testable import swlox

final class ScannerTests: XCTestCase {
  
  func testScanner() {
    let source = """
    // this is a comment
    (( )){} // grouping stuff
    !*+-/=<> <= == // operators
    
    """
    let scanner = Scanner(source: source)
    let resultTokens = scanner.scanTokens()
    
    let tokens: [Token] = [
      .init(type: .leftParentheses, lexeme: "(", literal: nil, line: 2),
      .init(type: .leftParentheses, lexeme: "(", literal: nil, line: 2),
      .init(type: .rightParentheses, lexeme: ")", literal: nil, line: 2),
      .init(type: .rightParentheses, lexeme: ")", literal: nil, line: 2),
      .init(type: .leftBrace, lexeme: "{", literal: nil, line: 2),
      .init(type: .rightBrace, lexeme: "}", literal: nil, line: 2),
      .init(type: .bang, lexeme: "!", literal: nil, line: 3),
      .init(type: .star, lexeme: "*", literal: nil, line: 3),
      .init(type: .plus, lexeme: "+", literal: nil, line: 3),
      .init(type: .minus, lexeme: "-", literal: nil, line: 3),
      .init(type: .slash, lexeme: "/", literal: nil, line: 3),
      .init(type: .equal, lexeme: "=", literal: nil, line: 3),
      .init(type: .less, lexeme: "<", literal: nil, line: 3),
      .init(type: .greater, lexeme: ">", literal: nil, line: 3),
      .init(type: .lessEqual, lexeme: "<=", literal: nil, line: 3),
      .init(type: .equalEqual, lexeme: "==", literal: nil, line: 3),
      .init(type: .eof, lexeme: "", literal: nil, line: 4),
    ]
    
    assert(resultTokens == tokens)
  }
}
