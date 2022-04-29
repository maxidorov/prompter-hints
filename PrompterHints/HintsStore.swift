//
//  ListViewModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation
import Combine

final class HintsStore: ObservableObject {
  private let persistentManager: PersistentManaging
  private var cancellable: AnyCancellable?

  @Published var hints: [HintModel]

  var newHintId: Int {
    (hints.map(\.id).max() ?? -1) + 1
  }

  init(persistentManager: PersistentManaging) {
    self.persistentManager = persistentManager
    self.hints = persistentManager.getHints()
    self.cancellable = $hints.sink(receiveValue: persistentManager.save)
  }

  func save(text: String, id: Int) {
    let hint = HintModel(id: id, text: text, date: Date())
    if let hintIndex = hints.firstIndex(where: { $0.id == id }) {
      hints[hintIndex] = hint
    } else {
      hints.append(hint)
    }
    hints.sort { $0.date > $1.date }
  }
}

extension HintsStore {
  static let mock = HintsStore(persistentManager: UserDefaultsManager())
}
