//
//  HintViewModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Combine

final class HintViewModel: ObservableObject {
  @Published
  var title: String = ""

  @Published
  var text: String = ""
}

extension HintViewModel {
  static let mock = HintViewModel()
}
