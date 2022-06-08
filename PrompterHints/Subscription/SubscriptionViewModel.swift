//
//  SubsciptiionViewModel.swift
//  PrompterHints
//
//  Created by MSP on 07.06.2022.
//

import Foundation
import Combine
import ApphudSDK
import StoreKit
import SwiftUI

final class SubscriptionViewModel: ObservableObject {
  enum ProductViewState {
    case loading
    case loaded(ApphudProduct?)
  }

  @Published var productViewState: ProductViewState = .loading

  var hasActiveSubscription: Bool {
    Apphud.hasActiveSubscription()
  }

  private var product: ApphudProduct? {
    switch productViewState {
    case .loading:
      return nil
    case let .loaded(product):
      return product
    }
  }

  func fetchPaywalls() {
    Apphud.paywallsDidLoadCallback { [weak self] paywalls in
      guard let self = self else { return }
      let product = paywalls.first?.products.first
      self.productViewState = .loaded(product)
    }
  }

  func purchase() {
    guard let product = product else {
      return
    }

    Apphud.purchase(product) { result in
      if let subscription = result.subscription, subscription.isActive() {
        AnalyticsManager.shared.log(.subscrptionAlreadyActive)
      } else if let purchase = result.nonRenewingPurchase, purchase.isActive() {
        AnalyticsManager.shared.log(.subscrptionAlreadyActive)
      } else {
        if result.error != nil {
          AnalyticsManager.shared.log(.subscrptionPurchasingFailed)
          return
        }

        AnalyticsManager.shared.log(.subscrptionPurchased)
      }
    }
  }
}
