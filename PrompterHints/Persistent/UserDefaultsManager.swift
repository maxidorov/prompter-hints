//
//  UserDefaultsManager.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

final class UserDefaultsManager: PersistentManaging {
  private let hintsKey = "hints"
  private let defaults = UserDefaults.standard
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()

  func save(hints: [HintModel]) {
    guard let data = try? encoder.encode(hints) else { return }
    defaults.set(data, forKey: hintsKey)
  }

  func getHints() -> [HintModel] {
    defaults.data(forKey: hintsKey).flatMap { data in
      try? decoder.decode([HintModel].self, from: data)
    }?.sorted(by: { $0.date > $1.date }) ?? []
  }
}

extension UserDefaultsManager {
  static let mock = UserDefaultsManager()
}
