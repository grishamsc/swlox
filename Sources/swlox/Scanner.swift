//
//  Scanner.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Foundation

class Scanner {
  let source: String
  var tokens = [Token]()
  
  private var start = 0
  private var current = 0
  private var line = 1

  private var isAtEnd: Bool {
    current >= source.count
  }
  
  init(source: String) {
    self.source = source
  }
  
  func scanTokens() -> [Token] {
    while(!isAtEnd) {
      start = current
      scanToken()
    }
    tokens.append(Token(type: .eof, lexeme: "", literal: nil, line: line))
//    print(tokens)
    return tokens
  }
}

private extension Scanner {
  func scanToken() {
    let char = advance()
    switch char {
    case "(": addToken(type: .leftParentheses)
    case ")": addToken(type: .rightParentheses)
    case "{": addToken(type: .leftBrace)
    case "}": addToken(type: .rightBrace)
    case ",": addToken(type: .comma)
    case ".": addToken(type: .dot)
    case "-": addToken(type: .minus)
    case "+": addToken(type: .plus)
    case ";": addToken(type: .semicolon)
    case "*": addToken(type: .star)
    case "!": addToken(type: match(expected: "=") ? .bangEqual : .bang)
    case "=": addToken(type: match(expected: "=") ? .equalEqual : .equal)
    case "<": addToken(type: match(expected: "=") ? .lessEqual : .less)
    case ">": addToken(type: match(expected: "=") ? .greaterEqual : .greater)
    case "/":
      if match(expected: "/") {
        while peek() != "\n" && !isAtEnd {
          _ = advance()
        }
      } else {
        addToken(type: .slash)
      }
    case " ", "\r", "\t":
      break
    case "\n":
      line += 1
    default:
      print(char)
      Swlox.error(line: line, message: "Unexpected character.")
    }
  }
  
  func advance() -> Character {
    let character = getCharAt(index: current)
    current += 1
    return character
  }
  
  func peek() -> Character {
    guard !isAtEnd else {
      return "\0"
    }
    return getCharAt(index: current)
  }
  
  func addToken(type: TokenType) {
    addToken(type: type, literal: nil)
  }
  
  func addToken(type: TokenType, literal: AnyObject?) {
    let startIndex = source.index(source.startIndex, offsetBy: start)
    let currentIndex = source.index(source.startIndex, offsetBy: current)
    let text = String(source[startIndex..<currentIndex])
    tokens.append(Token(type: type,
                        lexeme: text,
                        literal: literal,
                        line: line))
  }
  
  func match(expected: Character) -> Bool {
    guard !isAtEnd else { return false }
    guard getCharAt(index: current) == expected else { return false }
    current += 1;
    return true
  }
  
  func getCharAt(index: Int) -> Character {
    let index = source.index(source.startIndex, offsetBy: index)
    return source [index]
  }
}
