//
//  ScrollingTextView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import Foundation
import UIKit
import SwiftUI

struct ScrollableTextView: UIViewRepresentable {
  typealias UIViewType = ScrollableUITextView

  var text: String
  @Binding var speed: CGFloat
  @Binding var fontSize: CGFloat

  func makeUIView(context: Context) -> ScrollableUITextView {
    let view = ScrollableUITextView()
    view.text = text
    view.backgroundColor = .clear
    view.showsVerticalScrollIndicator = false
    view.isEditable = false
    view.setAttributedString()
    view.startScrolling()
    return view
  }

  func updateUIView(_ uiView: ScrollableUITextView, context: Context) {
    uiView.scrollingSpeed = speed
    uiView.setAttributedString(
      titleFontSize: 17 + 10 * fontSize,
      textFontSize: 13 + 10 * fontSize
    )
  }
}

class ScrollableUITextView: AttributedUITextView {
  var scrollingSpeed = CGFloat(UserDefaults.standard.textScrollingSpeed) {
    didSet {
      switch scrollingSpeed {
      case (1...): scrollingSpeed = 1
      case (..<0): scrollingSpeed = 0
      default: break
      }
      UserDefaults.standard.textScrollingSpeed = Float(scrollingSpeed)
    }
  }

  private var gap: CGFloat {
    return scrollingSpeed * 2
  }

  private var timer: Timer?

  override func awakeFromNib() {
    super.awakeFromNib()
    isEditable = false
  }

  func startScrolling() {
    timer?.invalidate()
    timer = Timer.scheduledTimer(
      withTimeInterval: 1 / 60,
      repeats: true,
      block: { _ in
        if self.contentSize.height - self.contentOffset.y > self.frame.height {
          self.contentOffset.y += self.gap
        }
      }
    )
  }

  func stopScrolling() {
    timer?.invalidate()
  }
}

class AttributedUITextView: UITextView {

//  var titleFontSize: Float? {
//    return UserDefaults.standard.textViewTextFontSize + 4
//  }
//
//  var textFontSize: Float = UserDefaults.standard.textViewTextFontSize {
//    didSet {
//      UserDefaults.standard.textViewTextFontSize = textFontSize
//    }
//  }

  override func awakeFromNib() {
    super.awakeFromNib()
    setupAppearance()
  }

  private func setupAppearance() {
    tintColor = .black
    textContainerInset = UIEdgeInsets(top: 0, left: 16, bottom: 200, right: 16)
    setAttributedString()
  }
}
