//
//  AnalyticsEvent.swift
//  PrompterHints
//
//  Created by MSP on 18.05.2022.
//

// swiftlint:disable identifier_name
enum AnalyticsEvent: String {
  case appLaunched

  case listScreenOpened
  case listScreenClosed

  case settingsScreenOpened
  case settingsScreenClosed

  case newHintScreenOpened
  case newHintScreenClosed

  case editHintScreenOpened
  case editHintScreenClosed

  case cameraScreenOpened
  case cameraScreenClosed

  case videoStartRecording
  case videoStopRecording

  case subscrptionScreenLoaded
  case subscrptionScreenClosed

  case subscriptionAlreadyActive
  case subscriptionPurchased
  case subscriptionPurchasingFailed
}

extension AnalyticsEvent {
  var name: String {
    rawValue
  }

  var metadata: [String: Any] {
    [:]
  }
}
