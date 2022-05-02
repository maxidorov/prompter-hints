//
//  UserDefaults.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation
import CoreGraphics
import Combine

class ObservableAppSettings: ObservableObject {
  @Published var textViewSpeed = AppSettings.textViewSpeed
  @Published var textViewFontSize = AppSettings.textViewFontSize

  private var cancellables = Set<AnyCancellable>()

  init() {
    $textViewSpeed.sink { AppSettings.textViewSpeed = $0 }.store(in: &cancellables)
    $textViewFontSize.sink { AppSettings.textViewFontSize = $0 }.store(in: &cancellables)
  }
}

struct AppSettings {
  @Storage(key: "textViewSpeed", defaultValue: 0.375)
  static var textViewSpeed: CGFloat

  @Storage(key: "textViewFontSize", defaultValue: 18.0)
  static var textViewFontSize: CGFloat
}

@propertyWrapper
struct Storage<T> {
  private let key: String
  private let defaultValue: T

  init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T {
    get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
    set { UserDefaults.standard.set(newValue, forKey: key) }
  }
}
