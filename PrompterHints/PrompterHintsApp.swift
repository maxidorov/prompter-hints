//
//  PrompterHintsApp.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI
import YandexMobileMetrica
import YandexMobileMetricaCrashes

@main
struct PrompterHintsApp: App {
  private let persitentManager: PersistentManaging = UserDefaultsManager()

  init() {
    configureAppearance()
    configureYandexMertrica()
    logAppLauched()
  }

  var body: some Scene {
    WindowGroup {
      switch appMode {
      case .prod:
        ListView(store: .init(persistentManager: persitentManager))
      case .cameraView:
        CameraView(
          presented: .constant(true),
          viewModel: CameraViewModel(
            text: HintModel.mock.text,
            speed: AppSettings.textViewSpeed,
            fontSize: AppSettings.textViewFontSize
          )
        )
      case .settings:
        SettingsView(presented: .constant(true))
      }
    }
  }
}

private func configureAppearance() {
  UIView.appearance().tintColor = .black
}

private func configureYandexMertrica() {
  let apiKey = "ed336c43-d873-4cc6-a789-2feff13bf349"
  if let configuration = YMMYandexMetricaConfiguration(apiKey: apiKey) {
    YMMYandexMetrica.activate(with: configuration)
  }
}

private func logAppLauched() {
  AnalyticsManager.shared.log(.appLaunched)
}

enum AppMode {
  case prod
  case cameraView
  case settings
}

private let appMode: AppMode = .prod
