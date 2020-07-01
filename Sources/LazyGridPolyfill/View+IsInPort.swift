//
//  View+IsInPort.swift
//  
//
//  Created by Tomas Harkema on 01/07/2020.
//

import SwiftUI

extension View {
  public func isInViewPort(_ handler: @escaping (Bool) -> ()) -> some View {
    return self.overlay(GeometryReader { proxy -> AnyView in
      let frame = proxy.frame(in: .global)
      let isInView = frame.intersects(UIScreen.main.bounds)
      DispatchQueue.main.async {
        handler(isInView)
      }
      return AnyView(Rectangle().fill(Color.clear))
    })
  }
}
