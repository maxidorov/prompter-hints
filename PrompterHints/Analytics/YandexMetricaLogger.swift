//
//  YandexMetricaLogger.swift
//  PrompterHints
//
//  Created by MSP on 18.05.2022.
//

import YandexMobileMetrica

final class YandexMetricaLogger: AnalyticsEventLogging {
  func sendAnalyticsEvent(named name: String, metadata: [String : Any]) {
    YMMYandexMetrica.reportEvent(name, parameters: metadata) { error in
      print("DID FAIL REPORT EVENT: %@", name)
      print("REPORT ERROR:", error.localizedDescription)
    }
  }
}
