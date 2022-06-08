//
//  AppContainerView.swift
//  PrompterHints
//
//  Created by MSP on 07.06.2022.
//

import SwiftUI
import Combine

struct AppContainerView: View {
  struct Deps {
    var persistentManager: PersistentManaging
    var subscriptionViewModel: SubscriptionViewModel
  }

  @State private var showSubscriptionView = true
  private var deps: Deps

  private var listView: some View {
    makeListView(persistentManager: deps.persistentManager)
  }

  private var subscriptionView: some View {
    makeSubscriptionView(viewModel: deps.subscriptionViewModel)
  }

  init(deps: Deps) {
    self.deps = deps
  }

  var body: some View {
    listView
      .sheet(
        isPresented: $showSubscriptionView,
        onDismiss: { showSubscriptionView = false },
        content: { subscriptionView }
      )
  }

  @ViewBuilder
  func makeListView(persistentManager: PersistentManaging) -> some View {
    ListView(store: .init(persistentManager: persistentManager))
  }

  @ViewBuilder
  func makeSubscriptionView(viewModel: SubscriptionViewModel) -> some View {
    SubscriptionView(
      viewModel: deps.subscriptionViewModel,
      showSubscriptionView: $showSubscriptionView
    )
  }
}
