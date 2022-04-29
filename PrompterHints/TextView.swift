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
      textView.setAttributedString(titleFontSize: 22, textFontSize: 18)
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
    uiView.setAttributedString(titleFontSize: 22, textFontSize: 18)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator($text)
  }
}
