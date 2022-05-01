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
      switch appMode {
      case .prod:
        ListView(store: .init(persistentManager: persitentManager))
      case .cameraView:
        CameraView()
      }
    }
  }
}

enum AppMode {
  case prod
  case cameraView
}

private let appMode: AppMode = .prod
