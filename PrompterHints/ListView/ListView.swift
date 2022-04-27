//
//  ListView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListView: View {
  @ObservedObject var viewModel: ListViewModel

  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(viewModel.hints) { hint in
          NavigationLink(destination: makeDestination(for: hint)) {
            makeCell(for: hint)
          }
          .buttonStyle(.plain)
        }
        .padding(.bottom, 80)
      }
      .overlay(NewNoteButton().dropShadow(), alignment: .bottom)
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
    HintView(viewModel: .init(
      mode: .edit,
      text: hint.text
    ))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(viewModel: .mock)
  }
}
