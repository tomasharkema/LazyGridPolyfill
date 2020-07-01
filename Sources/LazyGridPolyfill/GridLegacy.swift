//
//  GridLegacy.swift
//  
//
//  Created by Tomas Harkema on 01/07/2020.
//

import SwiftUI

struct GridLegacy<Data, ID, Content2: View>: View where Data.Element: Identifiable & Hashable, Data: RandomAccessCollection, ID == Data.Element.ID, Data.Index == Int {
  private let columns: Int
  private let spacing: CGFloat
  private let fullWidth: CGFloat
  private let c: ForEach<Data, ID, Content2>
  private var chunks: [EnumeratedSequence<[[Data.Element]]>.Element] {
    return Array(c.data.chunked(into: columns).enumerated())
  }

  @inlinable public init(
    columns: Int,
    spacing: CGFloat,
    fullWidth: CGFloat,
    @ViewBuilder content: () -> ForEach<Data, ID, Content2>
  ) {
    self.columns = columns
    self.spacing = spacing
    self.fullWidth = fullWidth
    c = content()
  }

  var body: some View {
    VStack(alignment: .leading, spacing: spacing) {
      ForEach(chunks, id: \.offset) { row in
        HStack(spacing: spacing) {
          ForEach(row.element) { column in
            LazyContent(c: c, column: column)
          }
        }
      }
    }
  }

  struct LazyContent: View {
    @State var isVisible: Bool = false

    let c: ForEach<Data, ID, Content2>
    let column: Data.Element


    private func size(proxy: GeometryProxy) -> some View {
      let frame = proxy.frame(in: .global)
      let isInView = frame.intersects(UIScreen.main.bounds)
      DispatchQueue.main.async {
        if isVisible != isInView {
          isVisible = isInView
        }
      }
      return Rectangle().fill(Color.clear)
    }

    var body: some View {
      Rectangle()
        .fill(Color.clear)
        .aspectRatio(1, contentMode: .fill)
        .isInViewPort { bool in
          if isVisible != bool {
            isVisible = bool
          }
        }
        .overlay(isVisible ? AnyView(c.content(column)) : AnyView(EmptyView()))
    }
  }
}
