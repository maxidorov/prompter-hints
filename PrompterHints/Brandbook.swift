//
//  Brandbook.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//
import UIKit

final class Brandbook {}

extension Brandbook {
  enum SupportedFonts: String {
    case avenirNext = "AvenirNext"
  }

  enum Weight: String {
    case thin     = "Thin"
    case regular  = "Regular"
    case bold     = "Bold"
    case demiBold = "DemiBold"
    case medium   = "Medium"
    case heavy    = "Heavy"
  }

  static func font(
    font: SupportedFonts = .avenirNext,
    size: CGFloat,
    weight: Weight = .regular
  ) -> UIFont {
    UIFont(
      name: (font.rawValue + "-" + weight.rawValue),
      size: size
    ) ?? getSystemFont(ofSize: size)
  }

  static func font(size: CGFloat, weight: Weight = .regular) -> UIFont {
    UIFont(
      name: (SupportedFonts.avenirNext.rawValue + "-" + weight.rawValue),
      size: size
    ) ?? getSystemFont(ofSize: size)
  }

  private static func getSystemFont(ofSize: CGFloat) -> UIFont {
    UIFont.systemFont(ofSize: ofSize)
  }
}
