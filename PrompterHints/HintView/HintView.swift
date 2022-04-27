//
//  HintView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI
import Combine

struct HintView: View {
  @ObservedObject var viewModel: HintViewModel

  var body: some View {
    TextView {
      $0.showsVerticalScrollIndicator = false
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .navigationTitle("New Note")
    .padding()
  }
}

struct HintView_Previews: PreviewProvider {
  static var previews: some View {
    HintView(viewModel: .mock)
  }
}
