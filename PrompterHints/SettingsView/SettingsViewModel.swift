//
//  SettingsViewModel.swift
//  PrompterHints
//
//  Created by MSP on 01.05.2022.
//

import Combine
import CoreGraphics

final class SettingsViewModel: ObservableObject {
  @Published var speed: CGFloat = 0.5
  @Published var fontSize: CGFloat = 0.5

  private var cancellables: Set<AnyCancellable> = []

  init() {
    $speed.sink { speed in
      print(speed)
    }.store(in: &cancellables)

    $fontSize.sink { fontSize in
      print(fontSize)
    }.store(in: &cancellables)
  }
}
