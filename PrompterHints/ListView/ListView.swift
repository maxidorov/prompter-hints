//
//  ListView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListView: View {
  @ObservedObject var store: HintsStore

  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(store.hints) { hint in
          NavigationLink(destination: makeDestination(for: hint)) {
            makeCell(for: hint)
          }
          .buttonStyle(.plain)
        }
        .padding(.bottom, 80)
      }
      .frame(maxWidth: .infinity)
      .overlay(NewNoteButton(store: store).dropShadow(), alignment: .bottom)
      .navigationTitle("Hints")
    }
  }

  private func makeCell(for hint: HintModel) -> some View {
    ListViewCell(model: .init(from: hint))
      .dropShadow()
      .padding(.horizontal)
      .padding(.vertical, .s1)
  }

  private func makeDestination(for hint: HintModel) -> some View {
    NewHintView(viewModel: .init(store: store))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(store: .mock)
  }
}
