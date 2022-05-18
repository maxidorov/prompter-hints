//
//  AnalyticsEventLogging.swift
//  PrompterHints
//
//  Created by MSP on 18.05.2022.
//

protocol AnalyticsEventLogging {
  func sendAnalyticsEvent(named name: String, metadata: [String: Any])
}
