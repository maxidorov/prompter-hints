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
    ScrollView {
      ForEach(viewModel.hints) { hint in
        ListViewCell(model: hint)
          .dropShadow()
          .padding(.horizontal)
          .padding(.vertical, .s1)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(viewModel: .mock)
  }
}
