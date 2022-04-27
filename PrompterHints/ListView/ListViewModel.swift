//
//  ListViewModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation
import Combine

final class ListViewModel: ObservableObject {
  private let persistentManager: PersistentManaging
  private var cancellable: AnyCancellable?

  @Published var hints: [HintModel]

  init(persistentManager: PersistentManaging) {
    self.persistentManager = persistentManager
    self.hints = persistentManager.getHints()

    self.cancellable = $hints.sink(receiveValue: { hints in
      persistentManager.save(hints: hints)
    })
  }
}

extension ListViewModel {
  static let mock = ListViewModel(persistentManager: UserDefaultsManager())
}
