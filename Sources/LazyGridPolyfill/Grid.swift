//
//  Grid.swift
//
//
//  Created by Tomas Harkema on 01/07/2020.
//

import SwiftUI

public struct Grid<Data, ID, Content2: View>: View where Data.Element: Identifiable & Hashable, Data: RandomAccessCollection, ID == Data.Element.ID, Data.Index == Int {
  private let columns: Int
  private let spacing: CGFloat
  private let fullWidth: CGFloat
  private let content: () -> ForEach<Data, ID, Content2>

  public init(
    columns: Int,
    spacing: CGFloat = 0,
    fullWidth: CGFloat,
    @ViewBuilder content: @escaping () -> ForEach<Data, ID, Content2>
  ) {
    self.columns = columns
    self.spacing = spacing
    self.fullWidth = fullWidth
    self.content = content
  }

  public var body: some View {
    if #available(macCatalyst 14, iOS 14, *) {
      return AnyView(GridNew(columns: max(1, columns), spacing: spacing, content: content))
    } else {
      return AnyView(
        GridLegacy(columns: max(1, columns), spacing: spacing, fullWidth: fullWidth, content: content)
      )
    }
  }
}
