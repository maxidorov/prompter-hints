//
//  PrompterHintsApp.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI
import YandexMobileMetrica
import YandexMobileMetricaCrashes
import ApphudSDK

@main
struct PrompterHintsApp: App {
  private let persistentManager: PersistentManaging = UserDefaultsManager()
  private let subscriptionViewModel = SubscriptionViewModel()

  init() {
    configureAppearance()
    configureYandexMetrica()
    configureApphud()
  }

  var body: some Scene {
    WindowGroup {
      switch appMode {
      case .prod:
        AppContainerView(deps: .init(
          persistentManager: persistentManager,
          subscriptionViewModel: subscriptionViewModel
        ))
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
      case .paywall:
        SubscriptionView(
          viewModel: subscriptionViewModel,
          showSubscriptionView: .constant(true)
        )
      }
    }
  }
}

private func configureAppearance() {
  UIView.appearance().tintColor = UIColor(hex: Brand.colorHex)
}

private func configureYandexMetrica() {
  if let configuration = YMMYandexMetricaConfiguration(apiKey: ApiKeys.yandexAppMetrica) {
    YMMYandexMetrica.activate(with: configuration)
  }
}

private func configureApphud() {
  Apphud.start(apiKey: ApiKeys.apphud)
}

enum AppMode {
  case prod
  case cameraView
  case settings
  case paywall
}

private let appMode: AppMode = .prod
