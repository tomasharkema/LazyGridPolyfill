//
//  RandomAccessCollection+Chunked.swift
//  
//
//  Created by Tomas Harkema on 01/07/2020.
//

import Foundation

extension RandomAccessCollection {
  func chunked(into size: Int) -> [[Element]] where Self.Index == Int {
    return stride(from: 0, to: count, by: size).map {
      Array(self[$0..<Swift.min($0 + size, count)])
    }
  }
}
