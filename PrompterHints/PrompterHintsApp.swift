//
//  PrompterHintsApp.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

@main
struct PrompterHintsApp: App {
  private let persitentManager: PersistentManaging = UserDefaultsManager()

  var body: some Scene {
    WindowGroup {
      ListView(store: .init(persistentManager: persitentManager))
    }
  }
}
