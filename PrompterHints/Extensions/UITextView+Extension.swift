//
//  UITextView+Extension.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import UIKit

extension UITextView {
  func setAttributedString(
    titleFontSize: CGFloat? = nil,
    textFontSize: CGFloat? = nil
  ) {
    guard text != nil else { return }

    let attributedString = NSMutableAttributedString(string: text)
    let titleLength = titleLength()

    let textFontSize = textFontSize ?? CGFloat(UserDefaults.standard.textViewTextFontSize)
    let titleFontSize = titleFontSize ?? textFontSize + 4

    attributedString.addAttributes(
      [
        .foregroundColor : UIColor.black,
        .font: Brandbook.font(size: titleFontSize, weight: .bold)
      ],
      range: NSRange(location: 0, length: titleLength)
    )

    if (text.count > titleLength) {
      attributedString.addAttributes(
        [
          .foregroundColor : UIColor.black,
          .font: Brandbook.font(size: textFontSize, weight: .demiBold)
        ],
        range: NSRange(location: titleLength, length: text.count - titleLength)
      )
    }

    attributedText = attributedString
  }

  func titleLength() -> Int {
    if let charactersBeforeNewLine = text.firstIndex(of: "\n") {
      return text.distance(
        from: text.startIndex,
        to: charactersBeforeNewLine
      ) + 1
    }
    return text.count
  }
}
