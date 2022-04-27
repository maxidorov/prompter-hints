//
//  HintViewModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Combine
import UIKit

final class HintViewModel: ObservableObject {
  @Published var mode: HintViewMode
  @Published var title: String
  @Published var text: String

  var textViewText: String {
    [title, text].joined(separator: "\n")
  }

  init(
    mode: HintViewMode,
    title: String = "",
    text: String = ""
  ) {
    self.mode = mode
    self.title = title
    self.text = text
  }

  func makeFirstResponderIfNeeded(_ view: UIResponder) {
    if mode == .new {
      view.becomeFirstResponder()
    }
  }
}

extension HintViewModel {
  static let new = HintViewModel(mode: .new)
  static let edit = HintViewModel(mode: .edit)
}
