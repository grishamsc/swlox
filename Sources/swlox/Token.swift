//
//  Token.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Foundation

struct Token: Equatable {
  static func == (lhs: Token, rhs: Token) -> Bool {
    lhs.type == rhs.type
    && lhs.lexeme == rhs.lexeme
    && lhs.literal === rhs.literal
    && lhs.line == rhs.line
  }
  
  let type: TokenType
  let lexeme: String
  let literal: AnyObject?
  let line: Int
  
  func toString() -> String {
    return "\(type) \(lexeme) \(String(describing: literal))"
  }
}



