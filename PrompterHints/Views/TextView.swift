//
//  TextView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
  class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>

    init(_ text: Binding<String>) {
      self.text = text
    }

    func textViewDidChange(_ textView: UITextView) {
      text.wrappedValue = textView.text
      textView.setAttributedString(textFontSize: AppSettings.textViewFontSize)
    }
  }

  @Binding var text: String

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.autocapitalizationType = .sentences
    textView.isSelectable = true
    textView.isUserInteractionEnabled = true
    textView.showsVerticalScrollIndicator = false
    textView.delegate = context.coordinator
    return textView
  }

  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
    uiView.setAttributedString(textFontSize: AppSettings.textViewFontSize)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator($text)
  }
}

extension TextView: Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return true
  }
}
