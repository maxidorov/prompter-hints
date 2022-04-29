//
//  NewHintViewModel.swift
//  PrompterHints
//
//  Created by MSP on 28.04.2022.
//

import Foundation
import Combine

final class NewHintViewModel: ObservableObject {
  private let store: HintsStore
  private var hintId: Int?
  @Published var text = ""

  private var cancellable: AnyCancellable?

  init(store: HintsStore) {
    self.store = store
    self.hintId = store.newHintId
    self.cancellable = $text
      .filter { $0 != "" }
      .removeDuplicates()
      .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
      .sink(receiveValue: { [weak self] text in
        guard let self = self, let id = self.hintId else { return }
        store.save(text: text, id: id)
      })
  }

  func reset() {
    text = ""
    hintId = store.newHintId
  }
}

extension NewHintViewModel {
  static let mock = NewHintViewModel(store: .mock)
}
