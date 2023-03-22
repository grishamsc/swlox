//
//  StderrorOutputStream.swift
//  
//
//  Created by Grigory on 21.3.23..
//

import Darwin

struct StderrOutputStream: TextOutputStream {
  mutating func write(_ string: String) {
    fputs(string, stderr)
  }
}
