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

  static var hasActiveSubscription: Bool {
    Apphud.hasActiveSubscription()
  }

  var showSubscriptionView: Binding<Bool>?
  @Published var productViewState: ProductViewState = .loading

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

    Apphud.purchase(product) { [weak self] result in
      if let subscription = result.subscription, subscription.isActive() {
        AnalyticsManager.shared.log(.subscriptionAlreadyActive)
      } else if let purchase = result.nonRenewingPurchase, purchase.isActive() {
        AnalyticsManager.shared.log(.subscriptionAlreadyActive)
      } else {
        if result.error != nil {
          AnalyticsManager.shared.log(.subscriptionPurchasingFailed)
          return
        }

        AnalyticsManager.shared.log(.subscriptionPurchased)
      }

      self?.showSubscriptionView?.wrappedValue = false
    }
  }

  func restorePurchases() {
    Apphud.restorePurchases { [weak self] _, _, _ in
      self?.showSubscriptionView?.wrappedValue = false
    }
  }
}
