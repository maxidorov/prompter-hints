//
//  SKProduct+Extension.swift
//  PrompterHints
//
//  Created by MSP on 08.06.2022.
//

import StoreKit

extension SKProduct {
  private static let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
  }()

  var readableDescription: String {
    let primaryPeriod: String = {
      switch self.subscriptionPeriod?.unit {
      case .day:
        return "day"
      case .week:
        return "week"
      case .month:
        return "month"
      case .year:
        return "year"
      case .none, .some:
        return ""
      }
    }()

    func getRealNumberOfUnitsAndPeriod() -> (Int, String) {
      let numberOfUnits = subscriptionPeriod?.numberOfUnits ?? 0
      if numberOfUnits == 7 && primaryPeriod == "day" {
        return (1, "week")
      }
      return (numberOfUnits, primaryPeriod)
    }

    let (numberOfUnits, period) = getRealNumberOfUnitsAndPeriod()
    let pluralPeriod = numberOfUnits > 1 ? "\(period)s" : period
    let stringNumberOfUnits = (numberOfUnits == 1) ? "" : "\(numberOfUnits) "
    return "\(localizedPrice!) per \(stringNumberOfUnits)\(pluralPeriod)"
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
