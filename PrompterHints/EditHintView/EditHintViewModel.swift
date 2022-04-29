//
//  EditHintViewModel.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import Foundation
import Combine

final class EditHintViewModel: ObservableObject {
  private let store: HintsStore
  private var hint: HintModel
  @Published var text: String

  private var cancellable: AnyCancellable?

  init(
    store: HintsStore,
    hint: HintModel
  ) {
    self.store = store
    self.hint = hint
    self.text = hint.text
    self.cancellable = $text
      .dropFirst()
      .removeDuplicates()
      .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
      .sink(receiveValue: { text in
        store.save(text: text, id: hint.id)
      })
  }
}
