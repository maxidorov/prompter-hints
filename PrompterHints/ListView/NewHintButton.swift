//
//  NewHintButton.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct NewHintButton: View {
  @Binding var showSubscriptionView: Bool
  let store: HintsStore

  @State private var showNewHintView = false

  var body: some View {
    NavigationLink(
      isActive: $showNewHintView,
      destination: { NewHintView(viewModel: .init(store: store)) }
    ) {
      Text("New Hint")
        .fontWeight(.medium)
        .foregroundColor(Color(hex: Brand.colorHex))
        .padding(.s4)
        .background(Color.white)
        .clipShape(Capsule())
        .asButton {
          if !store.hints.isEmpty && !SubscriptionViewModel.hasActiveSubscription {
            showSubscriptionView = true
          } else {
            showNewHintView = true
          }
        }
    }
  }
}

struct NewNoteButton_Previews: PreviewProvider {
  static var previews: some View {
    NewHintButton(showSubscriptionView: .constant(true), store: .mock)
      .previewLayout(.sizeThatFits)
  }
}
