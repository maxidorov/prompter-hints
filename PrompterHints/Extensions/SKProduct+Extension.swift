//
//  SKProduct+Extension.swift
//  PrompterHints
//
//  Created by MSP on 08.06.2022.
//

import StoreKit
import SwiftUI

extension SKProduct {
  struct LocalizedPeriods {
    static let day: String = "day"
    static let week: String = "week"
    static let month: String = "month"
    static let year: String = "year"
  }
  private static let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
  }()

  var readableDescription: String {
    let primaryPeriod: String = {
      switch self.subscriptionPeriod?.unit {
      case .day:
        return LocalizedPeriods.day
      case .week:
        return LocalizedPeriods.week
      case .month:
        return LocalizedPeriods.month
      case .year:
        return LocalizedPeriods.year
      case .none, .some:
        return ""
      }
    }()

    func getRealNumberOfUnitsAndPeriod() -> (Int, String) {
      let numberOfUnits = subscriptionPeriod?.numberOfUnits ?? 0
      if numberOfUnits == 7 && primaryPeriod == "day" {
        return (1, .localizedString(for: "week", locale: .current))
      }
      return (numberOfUnits, primaryPeriod)
    }

    let (numberOfUnits, period) = getRealNumberOfUnitsAndPeriod()
    let stringNumberOfUnits = (numberOfUnits == 1) ? "" : "\(numberOfUnits) "
    let localizedPeriodPrefix: String = .localizedString(for: "per", locale: .current)
    return "\(localizedPrice!) \(localizedPeriodPrefix) \(stringNumberOfUnits)\(period)"
  }

  private var localizedPrice: String? {
    let formatter = SKProduct.formatter
    formatter.locale = priceLocale
    return formatter.string(from: price)
  }
}

extension SKProductDiscount {
  var localizedPrice: String? {
    priceFormatter(locale: priceLocale).string(from: price)
  }

  var localizedSubscriptionPeriod: String {
    let dateComponents: DateComponents

    switch subscriptionPeriod.unit {
    case .day: dateComponents = DateComponents(day: subscriptionPeriod.numberOfUnits)
    case .week: dateComponents = DateComponents(weekOfMonth: subscriptionPeriod.numberOfUnits)
    case .month: dateComponents = DateComponents(month: subscriptionPeriod.numberOfUnits)
    case .year: dateComponents = DateComponents(year: subscriptionPeriod.numberOfUnits)
    @unknown default:
      print("WARNING: SwiftyStoreKit localizedSubscriptionPeriod does not handle all SKProduct.PeriodUnit cases.")
      dateComponents = DateComponents(month: subscriptionPeriod.numberOfUnits)
    }

    return DateComponentsFormatter.localizedString(from: dateComponents, unitsStyle: .full) ?? ""
  }

  private func priceFormatter(locale: Locale) -> NumberFormatter {
    let formatter = NumberFormatter()
    formatter.locale = locale
    formatter.numberStyle = .currency
    return formatter
  }
}

extension String {
  static func localizedString(
    for key: String,
    locale: Locale = .current
  ) -> String {

    let language = locale.languageCode
    let path = Bundle.main.path(forResource: language, ofType: "lproj")!
    let bundle = Bundle(path: path)!
    let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")

    return localizedString
  }
}
