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
  @Published var text: String

  init(
    mode: HintViewMode,
    text: String = ""
  ) {
    self.mode = mode
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
