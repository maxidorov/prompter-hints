//
//  UIColor+Extension.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI
import UIKit

extension Color {
  init(hex: UInt, alpha: Double = 1) {
    let rgb = hexToRgb(hex)
    self.init(.sRGB, red: rgb.red, green: rgb.green, blue: rgb.blue, opacity: alpha)
  }
}

extension UIColor {
  convenience init(hex: UInt, alpha: Double = 1) {
    let rgb = hexToRgb(hex)
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: alpha)
  }
}

private func hexToRgb(
  _ hex: UInt
) -> (red: Double, green: Double, blue: Double) {
  (
    red: Double((hex >> 16) & 0xff) / 255,
    green: Double((hex >> 08) & 0xff) / 255,
    blue: Double((hex >> 00) & 0xff) / 255
  )
}
