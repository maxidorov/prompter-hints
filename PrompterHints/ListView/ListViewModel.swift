//
//  ListViewModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation
import Combine

final class ListViewModel: ObservableObject {
  @Published var hints: [HintModel]

  init(hints: [HintModel]) {
    self.hints = hints
  }
}

extension ListViewModel {
  static let mock = ListViewModel(hints: (1...10).map { number in
      .init(
        id: number,
        text: HintModel.mock.text,
        date: Date()
      )
  })
}
