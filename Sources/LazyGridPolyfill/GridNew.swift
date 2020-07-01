//
//  File.swift
//  
//
//  Created by Tomas Harkema on 01/07/2020.
//

import SwiftUI

@available(iOS 14, macCatalyst 14, *)
struct GridNew<Content: View>: View {
  let columns: Int
  let body: LazyVGrid<Content>

  @inlinable public init(
    columns: Int,
    spacing: CGFloat,
    @ViewBuilder content: () -> Content
  ) {
    self.columns = columns
    body = LazyVGrid(columns: Array(repeating: GridItem(spacing: spacing), count: columns), spacing: spacing, content: content)
  }
}
