//
//  ListView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListView: View {
  @ObservedObject
  var viewModel: ListViewModel

  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(viewModel.hints) { hint in
          NavigationLink(destination: HintView(viewModel: .mock)) {
            ListViewCell(model: hint)
              .dropShadow()
              .padding(.horizontal)
              .padding(.vertical, .s1)
          }
          .buttonStyle(.plain)
        }
      }
      .navigationTitle("Hints")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(viewModel: .mock)
  }
}
