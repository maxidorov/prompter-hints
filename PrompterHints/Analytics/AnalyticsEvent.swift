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
  case newHintScrennClosed

  case editHintScreenOpened
  case editHintScreenClosed

  case cameraScreenOpened
  case cameraScreenClosed

  case videoStartRecording
  case videoStopRecording
}

extension AnalyticsEvent {
  var name: String {
    rawValue
  }

  var metadata: [String: Any] {
    [:]
  }
}
