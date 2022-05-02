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

  init() {
    UIView.appearance().tintColor = .black
  }

  var body: some Scene {
    WindowGroup {
      switch appMode {
      case .prod:
        ListView(store: .init(persistentManager: persitentManager))
      case .cameraView:
        CameraView(viewModel: CameraViewModel(text: HintModel.mock.text))
      case .settings:
        SettingsView(presented: .constant(true))
      }
    }
  }
}

enum AppMode {
  case prod
  case cameraView
  case settings
}

private let appMode: AppMode = .prod
