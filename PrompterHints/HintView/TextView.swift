//
//  TextView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
  var configuration = { (_: UITextView) in }
  private let delegate = TextViewDelegate()

  func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextView {
    let textView = UITextView()
    textView.delegate = delegate
    textView.becomeFirstResponder()
    return textView
  }

  func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
    configuration(uiView)
  }
}

final private class TextViewDelegate: NSObject, UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    textView.setAttributedString(titleFontSize: 22, textFontSize: 18)
  }
}
