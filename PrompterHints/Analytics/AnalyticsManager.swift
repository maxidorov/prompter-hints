//
//  AnalyticsManager.swift
//  PrompterHints
//
//  Created by MSP on 18.05.2022.
//

final class AnalyticsManager {
  static let shared = AnalyticsManager(logger: YandexMetricaLogger())

  private let logger: AnalyticsEventLogging

  private init(logger: AnalyticsEventLogging) {
    self.logger = logger
  }

  func log(_ event: AnalyticsEvent) {
    #if DEBUG
    print("EVENT NAME:", event.name)
    print("EVENT META:", event.metadata)
    #else
    logger.sendAnalyticsEvent(
      named: event.name,
      metadata: event.metadata
    )
    #endif
  }
}
