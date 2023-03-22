//
//  TokenType.swift
//  
//
//  Created by Grigory on 22.3.23..
//

import Foundation

enum TokenType {
  // Single-character tokens.
  case leftParentheses, rightParentheses, leftBrace, rightBrace,
       comma, dot, minus, plus, semicolon, slash, star
  
  // One or two character tokens.
  case bang, bangEqual,
       equal, equalEqual,
       greater, greaterEqual,
       less, lessEqual
  
  // Literals.
  case identifier, string, number
  
  // Keywords.
  case and, `class`, `else`, `false`, fun, `for`, `if`, `nil`, `or`,
       print, `return`, `super`, this, `true`, `var`, `while`, eof
}
