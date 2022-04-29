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
}
