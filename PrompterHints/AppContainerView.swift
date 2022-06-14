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

  @State private var showSubscriptionView =
    AppSettings.isFirstLaunch && !SubscriptionViewModel.hasActiveSubscription

  private var deps: Deps

  private var listView: some View {
    makeListView(
      showSubscriptionView: $showSubscriptionView,
      persistentManager: deps.persistentManager
    )
  }

  private var subscriptionView: some View {
    makeSubscriptionView(viewModel: deps.subscriptionViewModel)
  }

  init(deps: Deps) {
    self.deps = deps
  }

  var body: some View {
    listView
      .fullScreenCover(
        isPresented: $showSubscriptionView,
        onDismiss: { showSubscriptionView = false },
        content: { subscriptionView }
      )
      .onAppear {
        AppSettings.isFirstLaunch = false
      }
  }

  @ViewBuilder
  func makeListView(
    showSubscriptionView: Binding<Bool>,
    persistentManager: PersistentManaging
  ) -> some View {
    ListView(
      store: .init(persistentManager: persistentManager),
      showSubscriptionView: showSubscriptionView
    )
  }

  func makeSubscriptionView(viewModel: SubscriptionViewModel) -> some View {
    deps.subscriptionViewModel.showSubscriptionView = $showSubscriptionView
    return SubscriptionView(
      viewModel: deps.subscriptionViewModel,
      showSubscriptionView: $showSubscriptionView
    )
  }
}
