//
//  View+Extension.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

extension View {
  func dropShadow() -> some View {
    shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 0)
  }

  func frame(square value: CGFloat) -> some View {
    frame(width: value, height: value)
  }

  func fadeEdjes() -> some View {
    let fadeUp = Gradient(colors: [Color.clear, Color.black])
    let fadeDown = Gradient(colors: [Color.black, Color.clear])
    return self
      .mask(LinearGradient(gradient: fadeUp, startPoint: .top, endPoint: .center))
      .mask(LinearGradient(gradient: fadeDown, startPoint: .center, endPoint: .bottom))
  }
}
